#ifndef QAOA_H
#define QAOA_H

#include <cmath>
#include <cstdint>
#include <vector>

// Define PI since M_PI is not standard C++
#ifndef M_PI
#define M_PI 3.14159265358979323846
#endif

// =======================================================
// 1. Configuration 
// =======================================================

/**
 * Configuration structure for N_CITIES.
 */
template<int N_CITIES>
struct Config {
    static const int nCities = N_CITIES;
    static const int nQubits = N_CITIES * N_CITIES;
    // DIM = 2^(N_QUBITS)
    static const int DIM = 1 << (N_CITIES * N_CITIES);
};
typedef Config<3> CFG; // Default 3 cities

// =======================================================
// 2. Complex Number Class
// =======================================================

struct ComplexQ {
    double re;
    double im;

    ComplexQ(): re(0.0), im(0.0) {}
    ComplexQ(double _r, double _i): re(_r), im(_i) {}

    // Operator overloads (inline definitions kept here for efficiency)
    inline ComplexQ operator*(const ComplexQ& o) const {
        return ComplexQ(re*o.re - im*o.im, re*o.im + im*o.re);
    }
    inline ComplexQ operator+(const ComplexQ& o) const {
        return ComplexQ(re + o.re, im + o.im);
    }
    inline ComplexQ& operator*=(const ComplexQ& o) {
        double temp_re = re*o.re - im*o.im;
        im = re*o.im + im*o.re;
        re = temp_re;
        return *this;
    }
};

// =======================================================
// 3. Function Declarations
// =======================================================

/**
 * Calculates the Z-eigenvalue for a state 's' at qubit 'q'.
 * Corresponds to (-1)^(bit q of s).
 * Returns +1 if the bit is 0 (|0> state)
 * Returns -1 if the bit is 1 (|1> state)
 */
inline int Z_eigenvalue_uint(uint32_t s, int q) {
    // Check the q-th bit of s
    if ((s >> q) & 1u) {
        return -1; // Qubit is |1>, Z eigenvalue is -1
    } else {
        return 1;  // Qubit is |0>, Z eigenvalue is +1
    }
}
/**
 * Calculates the classical cost (eigenvalue) H_s for a single bitstring state 's'.
 */
template<int N>
double costHamiltonian_uint(uint32_t s, const double d[N][N]);

/**
 * Initializes the state vector to the equal superposition state |+>^n.
 */
template<int N>
void initialize_equal_superposition(ComplexQ state[CFG::DIM]);

/**
 * Applies the Cost Unitary U_C(gamma) = exp(-i * gamma * H_C) to the state vector.
 */
template<int N>
void applyCost_hls(ComplexQ state[CFG::DIM], const double d[N][N], double gamma);

/**
 * Applies the Mixer Unitary U_B(beta) = \prod_q R_X(2*beta)_q to the state vector.
 */
template<int N>
void applyMixer_hls(ComplexQ state[CFG::DIM], double beta);

/**
 * Top-level function for a single QAOA layer (U_B * U_C). (HLS Entry Point)
 */
template<int N>
void qaoaStep_hls(ComplexQ state[CFG::DIM],
                  const double d[N][N],
                  double gamma, double beta);

#endif // QAOA_H
