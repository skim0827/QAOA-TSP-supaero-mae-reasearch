# include "qaoa.hpp"
# include <iostream>

int main(){
    double d[3][3] = = {
        {0.0, 10.0, 4.7},
        {10.0, 0.0, 11.0},
        {4.7, 11.0, 0.0}
    };
    double gamma = 0.8;
    double beta = 1.5;
    double expectation = 0.0;

    qaoa_kernel<3>(d, gamma, beta, &expectation);
    std::cout << "Expectation value = " << expectation << std::endl;
    return 0;
}