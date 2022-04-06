interface dpram_if(input clk,clk2);

logic [3:0] addr1,data_in1,addr2,data_in2;
logic we1,we2,rst;
logic [3:0] data_out1,data_out2;

clocking cb@(posedge clk);

default input #1ns output #1ns;

input data_out1;
output addr1,data_in1,we1,rst;

endclocking

clocking cb1@(posedge clk2);
default input #1ns output #1ns;
input data_out2;
output data_in2,we2,addr2,rst;
endclocking

modport DUT(input addr1,addr2,data_in1,data_in2,we1,we2,rst,clk,clk2,output data_out1,data_out2);
modport TB(clocking cb,clocking cb1, input clk,clk2,data_out1,data_out2,output addr1,addr2,data_in1,data_in2,we1,we2,rst);

endinterface