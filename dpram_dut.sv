module dpram_dut(dpram_if.DUT intf);
bit [3:0]mem[0:15];
always@(posedge intf.clk)
if(intf.rst)
intf.data_out1 <= 4'b0000;
else if(intf.we1)
mem[intf.addr1] <= intf.data_in1;
else
intf.data_out1 <= mem[intf.addr1];

always@(posedge intf.clk2)
if(intf.rst)
intf.data_out2 <= 4'b0000;
else if(intf.we2)
mem[intf.addr2] <= intf.data_in2;
else
intf.data_out2 <= mem[intf.addr2];
endmodule
