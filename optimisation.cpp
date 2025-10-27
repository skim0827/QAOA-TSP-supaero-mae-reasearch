#include "qaoa.hpp"
# include <iostream>
#include <cmath>
#include <limits>
#include <bitset>
#include <nlopt.hpp>

static double d[3][3] = {
    {0.0, 10.0, 4.7},
    {10.0, 0.0, 11.0},
    {4.7, 11.0, 0.0}
};

template<int N_CITY>
uint32_t brute_force(const double d[N_CITY][N_CITY], double &min_energy_out) {
    const int DIM = Config<N_CITY>::DIM; // number of bitstrings = 2^(N_CITY*N_CITY)
    double min_energy = 1e9;
    uint32_t best_state = 0;

    for (uint32_t s = 0; s < DIM; ++s) {
        double energy = costHamiltonian<N_CITY>(s, d);
        if (energy < min_energy) {
            min_energy = energy;
            best_state = s;
        }
    }

    min_energy_out = min_energy;
    return best_state;
}

double objective_function(const std::vector<double>& x, std::vector<double>& grad, void* data) {
    (void)grad; (void)data;
    double expectation = 0.0;
    double gamma = x[0];
    double beta  = x[1];
    qaoa_kernel(d, gamma, beta, &expectation);
    return expectation;
}

void qaoa_kernel_debug(const double d[3][3],
                       double gamma,
                       double beta,
                       double* expectation_out,
                       uint32_t* best_state_out)
{
    ComplexQ state[Config<3>::DIM];
    qaoaStep_hls<3>(state, d, gamma, beta);
    double result = expectation_cost<3>(state, d);
    *expectation_out = result;

    double min_energy;
    uint32_t best_state = brute_force<3>(d, min_energy);
    *best_state_out = best_state;

    std::cout << "Best bitstring (9 bits): " << std::bitset<9>(best_state) << std::endl;
}


// simple random search 

int main() {
    const int N_CITY = 3;
    double d[3][3] = {
        {0.0, 10.0, 4.7},
        {10.0, 0.0, 11.0},
        {4.7, 11.0, 0.0}
    };


    // === brute force method : 001010100, E = 25.7 === 
    // double min_energy;
    // uint32_t best_state = brute_force_min<3>(d, min_energy);

    // std::cout << "Minimum energy: " << min_energy << std::endl;
    // std::cout << "Best bitstring (9 bits): " << std::bitset<9>(best_state) << std::endl;

    // === Op ===
    double gamma = 0.5; 
    double beta = 0.5;
    uint32_t best_state = -1;

    // --- Set up NLopt (Nelder–Mead) ---
    nlopt::opt opt(nlopt::LN_NELDERMEAD, 2);
    opt.set_lower_bounds({0.0, 0.0});
    opt.set_upper_bounds({M_PI, M_PI});
    opt.set_min_objective(objective_function, nullptr);
    opt.set_xtol_rel(1e-4);
    
    // --- Run optimizer ---
    std::vector<double> x = {gamma, beta};
    double min_expectation ;
    nlopt::result result = opt.optimize(x, min_expectation);
    std::cout << "Optimized γ = " << x[0] << ", β = " << x[1]
              << " | Minimum Expectation = " << min_expectation << std::endl;

    // --- Final evaluation ---
    double final_expectation = 0.0;
    qaoa_kernel_debug(d, x[0], x[1], &final_expectation, &best_state);
    std::cout << "\nFinal Results:" << std::endl;
    std::cout << "  Optimal γ = " << x[0] << std::endl;
    std::cout << "  Optimal β = " << x[1] << std::endl;
    std::cout << "  Expectation = " << final_expectation << std::endl;
    std::cout << "  Best bitstring (9 bits): " << std::bitset<9>(best_state) << std::endl;



    return 0;
}

