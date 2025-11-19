#include "qaoa.hpp"
# include <iostream>
#include <cmath>
#include <limits>
#include <bitset>
#include <nlopt.hpp>
#include <vector>

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

// ------------------- objective function for NLopt -------------------
double objective_function(const std::vector<double>& x, std::vector<double>& grad, void* data) {
    (void)grad; (void)data;

    static const int P = 3 ;
    double expectation = 0.0;
    double gamma[P] = { x[0], x[2], x[4] };
    double beta[P]  = { x[1], x[3], x[5] };

    uint32_t dummy = 0;
    
    expectation = qaoa_kernel(d, gamma, beta, false, &dummy);
    return expectation;
}

// ------------------- Debug wrapper -------------------
void qaoa_kernel_debug(const double d[3][3],
                       const double gamma[3],
                       const double beta[3],
                       double* expectation_out,
                       uint32_t* best_state_out)
{
    uint32_t best_state = 0; 

    double expectation = qaoa_kernel(d, gamma, beta, true, &best_state);

    *expectation_out = expectation ; 
    *best_state_out = best_state ;

    double min_energy_br;
    uint32_t best_state_br = brute_force<3>(d, min_energy_br);

    std::cout << "Best bitstring BRUTE (9 bits): "
              << std::bitset<9>(best_state_br) << std::endl;
    std::cout << "Best bitstring (QAOA p=2)  : "
              << std::bitset<9>(best_state) << std::endl;}


// ------------------- Main -------------------
int main() {
    const int N_CITY = 3;
    double d[3][3] = {
        {0.0, 10.0, 4.7},
        {10.0, 0.0, 11.0},
        {4.7, 11.0, 0.0}
    };

    // initial guess for γ1, β1, γ2, β2
    double gamma1 = 0.5;
    double beta1  = 0.5;
    double gamma2 = 0.3;
    double beta2  = 0.3;
    double gamma3 = 0.3;
    double beta3  = 0.3;
    

    // --- Set up NLopt (Nelder–Mead) ---
    nlopt::opt opt(nlopt::LN_NELDERMEAD, 6); // 4 parameters to optimise
    opt.set_lower_bounds({0.0, 0.0, 0.0, 0.0, 0.0, 0.0});
    opt.set_upper_bounds({M_PI, M_PI, M_PI, M_PI, M_PI, M_PI});
    opt.set_min_objective(objective_function, nullptr);
    opt.set_xtol_rel(1e-4);
    
    // --- Run optimizer ---
    std::vector<double> x = {gamma1, beta1, gamma2, beta2, gamma3, beta3};
    double min_expectation ;
    nlopt::result result = opt.optimize(x, min_expectation);

    // --- Final evaluation ---
    double final_expectation = 0.0;
    uint32_t best_state = -1;

    double gamma[3] = { x[0], x[2], x[4] };
    double beta[3]  = { x[1], x[3], x[5] };
    qaoa_kernel_debug(d, gamma, beta, &final_expectation, &best_state);
    std::cout << "\nFinal Results (p=2 QAOA):" << std::endl;
    std::cout << "  γ1 = " << gamma[0] << ", β1 = " << beta[0] << std::endl;
    std::cout << "  γ2 = " << gamma[1] << ", β2 = " << beta[1] << std::endl;
    std::cout << "  γ3 = " << gamma[2] << ", β3 = " << beta[2] << std::endl;

    std::cout << "  Expectation = " << final_expectation << std::endl;
    std::cout << "  Best bitstring (9 bits): "
              << std::bitset<9>(best_state) << std::endl;

    
    // optional: compare with brute-force
    double min_energy;
    uint32_t brute_best = brute_force<3>(d, min_energy);
    std::cout << "Brute-force optimal energy: " << min_energy << std::endl;
    std::cout << "Brute-force best bitstring: "
              << std::bitset<9>(brute_best) << std::endl;

    
    // ---- debug ----
    // double E_brute = costHamiltonian<3>(0b001010100, d);
    // double E_fpga  = costHamiltonian<3>(0b010010010, d);

    // std::cout << "E(brute)=" << E_brute << std::endl;
    // std::cout << "E(fpga) =" << E_fpga  << std::endl;


    return 0;
}

