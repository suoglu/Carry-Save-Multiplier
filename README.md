# Carry Save Multiplier

This repository contain variety of carry save multipliers. Random test cases are selected for simulation. Simulation file is [testbench.v](blob/master/testbench.v). Testing will be done on [Digilent Basys 3](https://reference.digilentinc.com/reference/programmable-logic/basys-3/reference-manual) FPGA.

**Parameterized:**

`csmulti_fullbasecell`
  * Simulation: with ISim on 25 Dec 2019
  * On FPGA: 26 Dec 2019
    * tested cases: 170x117, 203x45,  255x255, 243x178, 102x49, 132x149, 244x213, 180x173, 249x59,  165x161
    * tested for bitsize =  8

**4-bit:**

`multiCS4_v1`
  * Simulation: with ISim on 24 Dec 2019
  * On FPGA: 24 Dec 2019
    * tested cases: \*x0, \*x1, 6x6, 9x11, 15x15, 8x8, 3x4, 10x7, 9x14, 5x11, 5x13, 11x11, 5x3, 2x5, 2x9

`multiCS4_fullbasecell`
  * Simulation: with ISim on 24 Dec 2019
  * On FPGA: 24 Dec 2019
    * tested cases: \*x0, \*x1, 6x6, 9x11, 15x15, 8x8, 3x4, 10x7, 9x14, 5x11, 5x13, 11x11, 5x3, 2x5, 2x9
