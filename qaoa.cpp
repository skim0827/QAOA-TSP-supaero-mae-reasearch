#include "qaoa.hpp"
#include <iostream> // Included for HLS debugging/testing context (though not used in final HLS)


template<int N_CITY>
double costHamiltonian(uint32_t s, const double d[N_CITY][N_CITY]){
    double H = 0.0;
    double P  = 500;

    for (int i = 0; i < N_CITY; ++i){
    #pragma HLS PIPELINE II=1
        for (int j = 0; j < N_CITY; ++j){
    #pragma HLS UNROLL
            for (int t = 0; t < N_CITY; ++t){
                int next_t = (t + 1) % N_CITY;
                int Z_i_t = Z_eigenvalue_uint(s, (t*N_CITY) + i);
                int Z_j_t_1 = Z_eigenvalue_uint(s, (next_t*N_CITY) + j);
                H += d[i][j] * 0.25 * (1.0 - Z_i_t) * (1.0 - Z_j_t_1);

            }
        }

    }
    // std::cout << "distance contribution = " << H << std::endl;

    for (int i=0; i < N_CITY; i++) {
        double X_sum = 0.0;
        for (int t=0; t < N_CITY; t++) {
            X_sum += 0.5 * (1.0 - Z_eigenvalue_uint(s, t*N_CITY + i));
        }
        H += P * (X_sum - 1.0) * (X_sum - 1.0); 
    }

    for (int t=0; t < N_CITY ; t++) {
        double X_sum = 0.0;
        for (int i=0; i < N_CITY; i++) {
            X_sum += 0.5 * (1.0 - Z_eigenvalue_uint(s, t*N_CITY + i));
        }
        H += P * (X_sum - 1.0) * (X_sum - 1.0);
    }
    
    return H;
}
template<int N_CITY>
int build_feasible_superposition(ComplexQ state[Config<N_CITY>::DIM]) {
    #pragma HLS INLINE off
    const int DIM = Config<N_CITY>::DIM;
    int count = 0;
    for (int s = 0; s < DIM; ++s) {
        if (is_valid_onehot<N_CITY>(s)) ++count;
    }
    const double norm = 1.0 / std::sqrt((double)count);
    for (int s = 0; s < DIM; ++s) {
        state[s] = is_valid_onehot<N_CITY>(s) ? ComplexQ(norm, 0.0) : ComplexQ(0.0, 0.0);
    }
    return count;
}

template<int N_CITY>
bool is_valid_onehot(uint32_t s) {
    for (int t = 0; t < N_CITY; ++t) {
        int ones = 0;
        for (int i = 0; i < N_CITY; ++i) {
            ones += ((s >> (t * N_CITY + i)) & 1u);
        }
        if (ones != 1) return false;
    }
    return true;
}

template<int N_CITY>
void applyCost_hls(ComplexQ state[Config<N_CITY>::DIM], const double d[N_CITY][N_CITY], double gamma) {
    #pragma HLS INLINE off
    const int DIM = Config<N_CITY>::DIM;
    for (uint32_t s = 0; s < (uint32_t)DIM; s++) {
        double Hs = costHamiltonian<N_CITY>(s, d);
        double ang = gamma * Hs;
        state[s] *= ComplexQ(std::cos(ang), -std::sin(ang));

    }
}

template<int N_CITY>
void applyMixer_hls(ComplexQ state[Config<N_CITY>::DIM], double beta) {
    #pragma HLS INLINE off
    const double c = std::cos(2.0 * beta);
    const double s = std::sin(2.0 * beta);
    const uint32_t slice_mask = (1u << N_CITY) - 1u;

    // Two buffers to ping-pong between
    static ComplexQ bufA[Config<N_CITY>::DIM];
    static ComplexQ bufB[Config<N_CITY>::DIM];

    // Start in bufA
    
    for (uint32_t k = 0; k < (uint32_t)Config<N_CITY>::DIM; ++k) bufA[k] = state[k];


    ComplexQ* state_cur  = bufA;
    ComplexQ* state_next = bufB;
    #pragma HLS RESOURCE variable=state core=RAM_2P_BRAM
    #pragma HLS RESOURCE variable=bufA core=RAM_2P_BRAM
    #pragma HLS RESOURCE variable=bufB core=RAM_2P_BRAM

    for (int t = 0; t < N_CITY; ++t) {
        const int base = t * N_CITY;

        // For each pair (i,j), apply a 2×2 rotation and then swap buffers
        for (int i = 0; i < N_CITY; ++i) {
            for (int j = i + 1; j < N_CITY; ++j) {
                // Start from current state; copy unchanged amplitudes forward
                for (uint32_t k = 0; k < (uint32_t)Config<N_CITY>::DIM; ++k) state_next[k] = state_cur[k];

                const uint32_t bit_i = 1u << (t * N_CITY + i);
                const uint32_t bit_j = 1u << (t * N_CITY + j);
                const uint32_t mask  = bit_i | bit_j;

                for (uint32_t s_idx = 0; s_idx < (uint32_t)Config<N_CITY>::DIM; ++s_idx) {
                    const uint32_t slice = (s_idx >> base) & slice_mask;
                #pragma HLS PIPELINE II=1
                    // Only process when the slice has |i> active; we’ll write both partner entries.
                    if (slice == (1u << i)) {
                        const uint32_t s_flip = s_idx ^ mask; // toggles i and j
                        const ComplexQ a = state_cur[s_idx];
                        const ComplexQ b = state_cur[s_flip];

                        // [ a' ] = [  c   -i s ] [ a ]
                        // [ b' ]   [ -i s   c  ] [ b ]
                        state_next[s_idx]  = ComplexQ(c, 0.0) * a - ComplexQ(0.0, s) * b;
                        state_next[s_flip] = ComplexQ(0.0,-s) * a + ComplexQ(c, 0.0) * b;
                    }
                }

                // Compose this rotation: swap roles so the next rotation uses updated state
                ComplexQ* tmp = state_cur;
                state_cur = state_next;
                state_next = tmp;

            }
        }
    }

    // Write back the fully composed result
    for (uint32_t k = 0; k < (uint32_t)Config<N_CITY>::DIM; ++k) state[k] = state_cur[k];
}

template<int N_CITY>
double expectation_cost(ComplexQ state[Config<N_CITY>::DIM], const double d[N_CITY][N_CITY]){
    #pragma HLS INLINE off
    double result = 0.0; 
    for (int s = 0; s < Config<N_CITY>::DIM; s++){
    #pragma HLS PIPELINE II=1
        double prob = state[s].re*state[s].re + state[s].im*state[s].im;
        double Hs = costHamiltonian<N_CITY>(s, d);
        result += prob * Hs;

    }
    return result ; 
}
template<int N_CITY>
void qaoaStep_hls(ComplexQ state[Config<N_CITY>::DIM], const double d[N_CITY][N_CITY], double gamma, double beta){
    build_feasible_superposition<N_CITY>(state);
    applyCost_hls<N_CITY>(state, d, gamma);
    applyMixer_hls<N_CITY>(state, beta);
}

template<int N_CITY>
void qaoa_kernel(const double d[N_CITY][N_CITY],
                 double gamma,
                 double beta,
                 double* expectation_out) {
#pragma HLS INTERFACE m_axi     port=d                offset=slave bundle=gmem depth=9
#pragma HLS INTERFACE m_axi     port=expectation_out  offset=slave bundle=gmem depth=1
#pragma HLS INTERFACE s_axilite port=gamma
#pragma HLS INTERFACE s_axilite port=beta
#pragma HLS INTERFACE s_axilite port=return


    ComplexQ state[Config<N_CITY>::DIM];
#pragma HLS DATAFLOW

    qaoaStep_hls<N_CITY>(state, d, gamma, beta);

    double result = expectation_cost<N_CITY>(state, d);
    *expectation_out = result;
}


template double costHamiltonian<3>(uint32_t s, const double d[3][3]);
template void build_feasible_superposition<3>(ComplexQ state[Config<3>::DIM]);
template void applyCost_hls<3>(ComplexQ state[Config<3>::DIM], const double d[3][3], double gamma);
template void applyMixer_hls<3>(ComplexQ state[Config<3>::DIM], double beta);
template void qaoaStep_hls<3>(ComplexQ state[Config<3>::DIM], const double d[3][3], double gamma, double beta);
template void qaoa_kernel<3>(const double d[3][3],
                             double gamma,
                             double beta,
                             double* expectation_out);