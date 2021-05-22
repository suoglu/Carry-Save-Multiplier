
## Clock signal
set_property PACKAGE_PIN W5 [get_ports clk]
	set_property IOSTANDARD LVCMOS33 [get_ports clk]
	create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports clk]

## Switches
set_property PACKAGE_PIN V17 [get_ports {in0[0]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {in0[0]}]
set_property PACKAGE_PIN V16 [get_ports {in0[1]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {in0[1]}]
set_property PACKAGE_PIN W16 [get_ports {in0[2]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {in0[2]}]
set_property PACKAGE_PIN W17 [get_ports {in0[3]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {in0[3]}]
set_property PACKAGE_PIN W15 [get_ports {in0[4]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {in0[4]}]
set_property PACKAGE_PIN V15 [get_ports {in0[5]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {in0[5]}]
set_property PACKAGE_PIN W14 [get_ports {in0[6]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {in0[6]}]
set_property PACKAGE_PIN W13 [get_ports {in0[7]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {in0[7]}]
set_property PACKAGE_PIN V2 [get_ports {in1[0]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {in1[0]}]
set_property PACKAGE_PIN T3 [get_ports {in1[1]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {in1[1]}]
set_property PACKAGE_PIN T2 [get_ports {in1[2]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {in1[2]}]
set_property PACKAGE_PIN R3 [get_ports {in1[3]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {in1[3]}]
set_property PACKAGE_PIN W2 [get_ports {in1[4]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {in1[4]}]
set_property PACKAGE_PIN U1 [get_ports {in1[5]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {in1[5]}]
set_property PACKAGE_PIN T1 [get_ports {in1[6]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {in1[6]}]
set_property PACKAGE_PIN R2 [get_ports {in1[7]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {in1[7]}]

##7 segment display
set_property PACKAGE_PIN W7 [get_ports {a}]
	set_property IOSTANDARD LVCMOS33 [get_ports {a}]
set_property PACKAGE_PIN W6 [get_ports {b}]
	set_property IOSTANDARD LVCMOS33 [get_ports {b}]
set_property PACKAGE_PIN U8 [get_ports {c}]
	set_property IOSTANDARD LVCMOS33 [get_ports {c}]
set_property PACKAGE_PIN V8 [get_ports {d}]
	set_property IOSTANDARD LVCMOS33 [get_ports {d}]
set_property PACKAGE_PIN U5 [get_ports {e}]
	set_property IOSTANDARD LVCMOS33 [get_ports {e}]
set_property PACKAGE_PIN V5 [get_ports {f}]
	set_property IOSTANDARD LVCMOS33 [get_ports {f}]
set_property PACKAGE_PIN U7 [get_ports {g}]
	set_property IOSTANDARD LVCMOS33 [get_ports {g}]

set_property PACKAGE_PIN U2 [get_ports {an[0]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {an[0]}]
set_property PACKAGE_PIN U4 [get_ports {an[1]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {an[1]}]
set_property PACKAGE_PIN V4 [get_ports {an[2]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {an[2]}]
set_property PACKAGE_PIN W4 [get_ports {an[3]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {an[3]}]

##Buttons
set_property PACKAGE_PIN U18 [get_ports rst]
	set_property IOSTANDARD LVCMOS33 [get_ports rst]