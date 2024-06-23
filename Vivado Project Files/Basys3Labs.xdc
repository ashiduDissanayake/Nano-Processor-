
set_property PACKAGE_PIN W5 [get_ports Clk]
	set_property IOSTANDARD LVCMOS33 [get_ports Clk]
	create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports Clk]

set_property PACKAGE_PIN U18 [get_ports Reset]
	set_property IOSTANDARD LVCMOS33 [get_ports Reset]


## LEDs
set_property PACKAGE_PIN U16 [get_ports {L[0]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {L[0]}]
set_property PACKAGE_PIN E19 [get_ports {L[1]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {L[1]}]
set_property PACKAGE_PIN U19 [get_ports {L[2]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {L[2]}]
set_property PACKAGE_PIN V19 [get_ports {L[3]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {L[3]}]
set_property PACKAGE_PIN P3 [get_ports {C_Flag}]
    set_property IOSTANDARD LVCMOS33 [get_ports {C_Flag}]
set_property PACKAGE_PIN N3 [get_ports {Z_Flag}]
    set_property IOSTANDARD LVCMOS33 [get_ports {Z_Flag}]
set_property PACKAGE_PIN P1 [get_ports {N_Flag}]
	set_property IOSTANDARD LVCMOS33 [get_ports {N_Flag}]
set_property PACKAGE_PIN L1 [get_ports {P_Flag}]
	set_property IOSTANDARD LVCMOS33 [get_ports {P_Flag}]


##7 segment display
set_property PACKAGE_PIN W7 [get_ports {Seg_7[0]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {Seg_7[0]}]
set_property PACKAGE_PIN W6 [get_ports {Seg_7[1]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {Seg_7[1]}]
set_property PACKAGE_PIN U8 [get_ports {Seg_7[2]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {Seg_7[2]}]
set_property PACKAGE_PIN V8 [get_ports {Seg_7[3]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {Seg_7[3]}]
set_property PACKAGE_PIN U5 [get_ports {Seg_7[4]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {Seg_7[4]}]
set_property PACKAGE_PIN V5 [get_ports {Seg_7[5]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {Seg_7[5]}]
set_property PACKAGE_PIN U7 [get_ports {Seg_7[6]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {Seg_7[6]}]
	
	

set_property PACKAGE_PIN U2 [get_ports {Anode[0]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {Anode[0]}]
set_property PACKAGE_PIN U4 [get_ports {Anode[1]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {Anode[1]}]
set_property PACKAGE_PIN V4 [get_ports {Anode[2]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {Anode[2]}]
set_property PACKAGE_PIN W4 [get_ports {Anode[3]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {Anode[3]}]


