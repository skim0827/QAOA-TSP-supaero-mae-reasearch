#include "qaoa.hpp"
# include <iostream>
#include <bitset>


int main(){ 
    qfix d[3][3] = { {0.0, 10.0, 4.7}, {10.0, 0.0, 11.0}, {4.7, 11.0, 0.0} };
    qfix gamma[1] = { 0.8 };
    qfix beta[1]  = { 1.5 };
    uint32_t best_state = 0; 
    double result = qaoa_kernel(d, gamma, beta, true, &best_state); 
    std::cout << "Expectation value = " << result << std::endl;
    std::cout << "Best state = " << std::bitset<9>(best_state) << std::endl;
}