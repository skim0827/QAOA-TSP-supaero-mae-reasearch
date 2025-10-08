#include "qaoa.h"
#include <iostream> // Included for HLS debugging/testing context (though not used in final HLS)

// =======================================================
// 1. Non-Template Utility Implementation
// =======================================================

/**
 * Calculates the Z-eigenvalue for a state 's' at qubit 'q'.
 * Returns +1 if the bit is 0, -1 if the bit is 1.
 * Note: If Z_eigenvalue_uint was only declared in .h, its definition would go here.
 * Since it was declared inline, it is defined in qaoa.h.
 */
 

// =======================================================
// 2. Cost Hamiltonian Calculation (H_C) Implementation
// =======================================================

template<int N>
double costHamiltonian_uint(uint32_t s, const double d[N][N]) {
    const int nCities = N;
    const double P = 500.0; // Penalty factor
    double H = 0.0;

    // --- 1. Objective Term (Minimize Total Distance) ---
    for (int t = 0; t < nCities - 1; t++) {
        for (int i = 0; i < nCities; i++) {
            for (int j = 0; j < nCities; j++) {
                int Z_i_t = Z_eigenvalue_uint(s, (t*nCities) + i);
                int Z_j_t_1 = Z_eigenvalue_uint(s, ((t+1)*nCities) + j);
                H += d[i][j] * 0.25 * (1.0 - Z_i_t) * (1.0 - Z_j_t_1);
            }
        }
    }
    
    // --- 2. Visit-Each-City-Once Constraint (Penalty Term 1) ---
    for (int i=0; i < nCities; i++) {
        double X_sum = 0.0;
        for (int t=0; t < nCities; t++) {
            X_sum += 0.5 * (1.0 - Z_eigenvalue_uint(s, t*nCities + i));
        }
        H += P * (X_sum - 1.0) * (X_sum - 1.0); 
    }

    // --- 3. One-City-Per-Time-Slot Constraint (Penalty Term 2) ---
    for (int t=0; t < nCities; t++) {
        double X_sum = 0.0;
        for (int i=0; i < nCities; i++) {
            X_sum += 0.5 * (1.0 - Z_eigenvalue_uint(s, t*nCities + i));
        }
        H += P * (X_sum - 1.0) * (X_sum - 1.0);
    }
    
    return H;
}

// =======================================================
// 3. State Initialization Implementation
// =======================================================

template<int N>
void initialize_equal_superposition(ComplexQ state[CFG::DIM]) {
    const int DIM = Config<N>::DIM;
    double norm = 1.0 / sqrt((double)DIM);

    for (int s = 0; s < DIM; s++) {
        state[s] = ComplexQ(norm, 0.0);
    }
}

// =======================================================
// 4. Apply Cost Unitary U_C(gamma) Implementation
// =======================================================

template<int N>
void applyCost_hls(ComplexQ state[CFG::DIM], const double d[N][N], double gamma) {
    const int DIM = Config<N>::DIM;
    for (uint32_t s = 0; s < (uint32_t)DIM; s++) {
        // HLS Pragma goes here if this was the HLS top function
        
        double Hs = costHamiltonian_uint<N>(s, d);
        double ang = gamma * Hs;
        double cr = cos(ang);
        double ci = -sin(ang); // exp(-i...)
        ComplexQ phase(cr, ci);
        
        state[s] *= phase;
    }
}

// =======================================================
// 5. Apply Mixer Unitary U_B(beta) Implementation
// =======================================================

template<int N>
void applyMixer_hls(ComplexQ state[CFG::DIM], double beta) {
    const int N_QUBITS = Config<N>::nQubits;
    const int DIM = Config<N>::DIM;
    
    for (int q = 0; q < N_QUBITS; q++) {
        double c = cos(beta);
        double si_im = -sin(beta);
        
        for (uint32_t s = 0; s < (uint32_t)DIM; s++) {
            // HLS Pragma goes here
            
            uint32_t s_flipped = s ^ (1u << q);
            
            if (s < s_flipped) {
                ComplexQ a = state[s];
                ComplexQ b = state[s_flipped];
                
                ComplexQ C(c, 0.0);
                ComplexQ SI(0.0, si_im);
                
                ComplexQ a_prime = C * a;
                a_prime = a_prime + (SI * b);
                
                ComplexQ b_prime = SI * a;
                b_prime = b_prime + (C * b);
                
                state[s] = a_prime;
                state[s_flipped] = b_prime;
            }
        }
    }
}

// =======================================================
// 6. Top-level QAOA step (HLS Entry) Implementation
// =======================================================

template<int N>
void qaoaStep_hls(ComplexQ state[CFG::DIM],
                  const double d[N][N],
                  double gamma, double beta) {
    
    // HLS Interface pragmas for the top-level function would go here
    // ...
    applyCost_hls<N>(state, d, gamma);
    applyMixer_hls<N>(state, beta);
}


// =======================================================
// 7. EXPLICIT TEMPLATE INSTANTIATION FOR N=3
// =======================================================
// This is required so the linker finds the function bodies 
// when the testbench (tb.cpp) calls them.

template double costHamiltonian_uint<3>(uint32_t s, const double d[3][3]);
template void initialize_equal_superposition<3>(ComplexQ state[Config<3>::DIM]);
template void applyCost_hls<3>(ComplexQ state[Config<3>::DIM], const double d[3][3], double gamma);
template void applyMixer_hls<3>(ComplexQ state[Config<3>::DIM], double beta);
template void qaoaStep_hls<3>(ComplexQ state[Config<3>::DIM], const double d[3][3], double gamma, double beta);
