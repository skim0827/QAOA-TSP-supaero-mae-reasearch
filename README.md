# FPGA-Accelerated QAOA for TSP 

This is an year long research project for Master in Aerospace Engineering students at ISAE-Supaero in Toulouse, France. 

## Research Motivation 
Variational quantum algorithms such as QAOA rely on repeated evaluation of expectation values, a process that becomes computationally expensive as problem size or circuit depth increases. Hardware acceleration offers a practical way to reduce this bottleneck by exploiting parallelism and pipelining at the circuit level. Implementing the QAOA simulation on FPGA provides low-latency, energy-efficient computation while preserving the structure of hybrid quantum–classical workflows. This enables rapid exploration of variational parameter landscapes and helps evaluate how quantum-inspired algorithms might perform in future hardware co-designed quantum systems.

## Travelling Salesman Problem (TSP) 
The Traveling Salesman Problem is a standard NP-hard benchmark with a clear combinatorial structure that maps naturally onto QAOA’s cost Hamiltonian. It is widely used because small instances can be brute-forced for verification, while larger instances highlight the scalability challenges faced by both classical and quantum optimizers. Using TSP provides a meaningful and well-studied test case to evaluate how effectively QAOA, and its hardware-accelerated variants, can approximate solutions to difficult optimisation problems.


## Reference Paper 
Choi S., Lee K., Lee J.-J., Lee W. (2025). *Standalone FPGA-Based QAOA Emulator for Weighted-MaxCut on Embedded Devices*. arXiv:2502.11316. Available at: https://arxiv.org/abs/2502.11316


## FPGA - CPU Architecture 
![Overall Architecture](image/architecture_rp.png)

## Vivado System Architecture 
![Vivado System Architecture](image/vivado_bd.png)
## To Do
- Test on FPGA (Zybo Legacy)
- Documentation

## Maths 
### Cost Function 
Cost Function for TSP : 
$$
H_{\text{cost}} =
\sum_{t=0}^{n-1} \sum_{j=0}^{n-1} \sum_{i=0}^{n-1}
d_{i,j}\, x_{i,t}\, x_{j,t+1}
+ A \sum_{i=0}^{n-1} \left(1 - \sum_{t=0}^{n-1} x_{i,t}\right)^2
+ A \sum_{t=0}^{n-1} \left(1 - \sum_{i=0}^{n-1} x_{i,t}\right)^2
$$

## Quantum Encoding

$$
x_{i,p} \rightarrow \hat{x}_{i,p} = \frac{1 - \hat{Z}_{(i,p)}}{2}
$$


### Mixer Unitary  
Mixer Hamiltonion : Single Qubit Rotations about the X-Axis 
$$
U_M(\beta_k) = R_X(2\beta_k)^{\otimes n}
$$

Decomposition of Mixer Hamiltonion : 

$$
R_X(2\beta_k) =
\begin{pmatrix}
\cos(\beta_k) & -i\sin(\beta_k) \\
-i\sin(\beta_k) & \cos(\beta_k)
\end{pmatrix}
$$

### QAOA Step 
$$
U_M(\beta_k) U_C(\gamma_k) = \left(H^{\otimes n} D_M \right) \left(H^{\otimes n} D_C \right)
$$

where 
$$
D_C = U_C(\gamma_k) = e^{-i \gamma_k \hat{H}_C} = \sum_{k=0}^{\infty} \frac{(-i \gamma_k)^m}{m!} \hat{H}_C^m
$$

$$
D_M(l, l) = e^{i \beta_k (2HW(l-1) - n)} 
$$

### Expectation 

$$
\langle C \rangle = \langle \psi(\theta) | H_C | \psi(\theta) \rangle
$$

### State Vector Calculation

$$
\langle C \rangle_{\boldsymbol{\gamma}, \boldsymbol{\beta}}
=
\langle \psi^{(P)}(\boldsymbol{\gamma}, \boldsymbol{\beta}) |
\, H_C \,
| \psi^{(P)}(\boldsymbol{\gamma}, \boldsymbol{\beta}) \rangle
$$

