// tb.cpp -- CPU Testbench for QAOA VQE optimization.
#include <iostream>
#include <vector>
#include <bitset>
#include <cmath>
#include "qaoa.h" // Include the function declarations

using namespace std;

// =======================================================
// 1. Classical Cost Calculation
// =======================================================

/**
 * Calculates the Expected Cost (Expectation Value) C = <psi|H_C|psi>.
 * Calls the implementation of costHamiltonian_uint<N> defined in qaoa.cpp.
 */
template<int N>
double calculate_expected_cost(ComplexQ state[Config<N>::DIM],
                               const double d[N][N]) {
    double result = 0.0;
    for (int s = 0; s < Config<N>::DIM; s++) {
        double prob = state[s].re*state[s].re + state[s].im*state[s].im;
        double Hs = costHamiltonian_uint<N>((uint32_t)s, d);
        result += prob * Hs;
    }
    return result;
}

// =======================================================
// 2. Multi-Layer Circuit Run
// =======================================================

/**
 * Simulates the full p-layer QAOA circuit run.
 * Calls the implementation of qaoaStep_hls<N> defined in qaoa.cpp.
 */
template<int N>
void qaoa_circuit_run(ComplexQ state[Config<N>::DIM],
                      const double d[N][N],
                      const vector<double>& gammas,
                      const vector<double>& betas) {
    
    int p = gammas.size();
    
    // Start from the equal superposition |+>^n (implemented in qaoa.cpp)
    initialize_equal_superposition<N>(state);
    
    for (int i = 0; i < p; ++i) {
        // qaoaStep_hls applies U_C(gamma_i) U_B(beta_i)
        qaoaStep_hls<N>(state, d, gammas[i], betas[i]);
    }
}


// =======================================================
// 3. Parameter Shift Gradient Calculation
// =======================================================

/**
 * Calculates the partial derivative dC/d(theta_k) using the Parameter-Shift Rule.
 */
template<int N>
double parameter_shift_gradient(const double d[N][N],
                                const vector<double>& gammas_old,
                                const vector<double>& betas_old,
                                int param_idx) {
    
    const int DIM = Config<N>::DIM;
    vector<double> gammas_plus = gammas_old;
    vector<double> gammas_minus = gammas_old;
    vector<double> betas_plus = betas_old;
    vector<double> betas_minus = betas_old;

    int p = gammas_old.size();
    if (param_idx < p) {
        // Gamma parameter
        gammas_plus[param_idx] += M_PI / 2.0;
        gammas_minus[param_idx] -= M_PI / 2.0;
    } else {
        // Beta parameter
        int beta_idx = param_idx - p;
        betas_plus[beta_idx] += M_PI / 2.0;
        betas_minus[beta_idx] -= M_PI / 2.0;
    }

    ComplexQ state_plus[DIM];
    ComplexQ state_minus[DIM];

    // Forward Shift Run
    qaoa_circuit_run<N>(state_plus, d, gammas_plus, betas_plus);
    double exp_plus = calculate_expected_cost<N>(state_plus, d);

    // Backward Shift Run
    qaoa_circuit_run<N>(state_minus, d, gammas_minus, betas_minus);
    double exp_minus = calculate_expected_cost<N>(state_minus, d);

    // Parameter-Shift Rule
    return (exp_plus - exp_minus) / 2.0;
}

// =======================================================
// 4. Solution Extraction Utilities
// =======================================================

template<int N_DIM>
void extract_probabilities(const ComplexQ state[N_DIM], double probabilities[N_DIM]) {
    for (int s = 0; s < N_DIM; s++) {
        probabilities[s] = state[s].re * state[s].re + state[s].im * state[s].im;
    }
}

template<int N_DIM>
uint32_t idx_solution_bitstring(double probabilities[N_DIM]){
    uint32_t s_optimal = 0;
    double max_prob = -1.0; 

    for (uint32_t s = 0; s < N_DIM; s++) {
        if (probabilities[s] > max_prob) {
            max_prob = probabilities[s];
            s_optimal = s;
        }
    }
    return s_optimal;
}

void print_bitstring(uint32_t s_opt, int nQubits, int nCities) {
    std::string bitstring = std::bitset<32>(s_opt).to_string();
    std::string truncated_bitstring = bitstring.substr(32 - nQubits);
    
    std::cout << "Optimal Bitstring (City-Time, 1=Visited):\n";
    std::cout << "--------------------------------\n";

    // Format output to show the city visited at each time slot
    for (int t = 0; t < nCities; ++t) {
        std::cout << "Time " << t << ": ";
        for (int i = 0; i < nCities; ++i) {
            std::cout << truncated_bitstring[(t * nCities) + i] << " (City " << i << ")  ";
        }
        std::cout << "\n";
    }
    std::cout << "--------------------------------\n";
}

// =======================================================
// 5. Main Optimization Loop
// =======================================================

int main() {
    cout << "--- STARTING QAOA VQE OPTIMIZATION (CPU SIDE) ---" << endl;
    
    // Use the N=3 configuration (TB_CFG is Config<3>)
    typedef Config<3> TB_CFG;
    const int N_CITIES = TB_CFG::nCities;
    const int DIM      = TB_CFG::DIM;
    const int N_QUBITS = TB_CFG::nQubits;
    const int P_LAYERS = 2; // Number of QAOA layers (p)

    cout << "Configuration: " 
         << N_CITIES << " cities, "
         << N_QUBITS << " qubits, "
         << P_LAYERS << " layers\n";

    // Distance matrix (simple test values)
    double d[TB_CFG::nCities][TB_CFG::nCities];
    for (int i = 0; i < N_CITIES; i++) {
        for (int j = 0; j < N_CITIES; j++) {
            if (i == j) d[i][j] = 0.0;
            else d[i][j] = (double)(i + j + 1) * 1.0;
        }
    }

    // Parameters: Initialize to a small value
    vector<double> gammas(P_LAYERS, 0.1);
    vector<double> betas(P_LAYERS, 0.3);
    gammas[0] = 0.5;
    gammas[1] = 1.0;
    betas[0] = 1.0;
    betas[0] = 0.5;
    double learning_rate = 0.0005;
    int num_iterations = 200;
    const int TOTAL_PARAMS = 2 * P_LAYERS;
    
    ComplexQ state[DIM];

    for (int iter = 0; iter < num_iterations; iter++) {
        
        // 1. Calculate Current Cost
        qaoa_circuit_run<TB_CFG::nCities>(state, d, gammas, betas);
        double expected_cost = calculate_expected_cost<TB_CFG::nCities>(state, d);
        
        // 2. Calculate Gradients using Parameter Shift
        vector<double> gradients(TOTAL_PARAMS);
        for(int k = 0; k < TOTAL_PARAMS; ++k) {
            gradients[k] = parameter_shift_gradient<TB_CFG::nCities>(d, gammas, betas, k);
        }

        // 3. Update Parameters (Gradient Descent)
        for(int k = 0; k < P_LAYERS; ++k) {
            gammas[k] -= learning_rate * gradients[k];
            betas[k] -= learning_rate * gradients[k + P_LAYERS];
        }

        cout << "Iter " << iter
            << " | Cost=" << expected_cost
            << " | Grad_g1=" << gradients[0]
            << " | Grad_b2=" << gradients[P_LAYERS]
            << " | Gamma1=" << gammas[0]
            << " | Beta1=" << betas[0] << (P_LAYERS > 1 ? "..." : "")
            << endl;
    }    
    
    // 4. Final Solution Extraction
    double probabilities[DIM];
    extract_probabilities<DIM>(state, probabilities);

    uint32_t s_opt = idx_solution_bitstring<DIM>(probabilities);
    
    std::cout << "\n--- OPTIMIZATION COMPLETE ---\n";
    std::cout << "Final Cost: " << calculate_expected_cost<TB_CFG::nCities>(state, d) << "\n";
    std::cout << "Highest Probability: " << probabilities[s_opt] << "\n";
    
    print_bitstring(s_opt, N_QUBITS, N_CITIES);

    return 0;
}
