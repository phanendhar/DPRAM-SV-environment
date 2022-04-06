`ifndef _dpram_base_
`define _dpram_base_

class base_pkt;

rand bit [3:0] addr1,addr2,data_in1,data_in2;
bit rst,we1,we2;
bit[3:0] data_out1,data_out2;

endclass

`endif 