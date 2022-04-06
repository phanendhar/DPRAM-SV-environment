`include "dpram_basepkt.sv"

`ifndef _dpram_bfm_
`define _dpram_bfm_

class bfm;

base_pkt pkt1;
mailbox dr2bfm,bfm2sb;
bit [3:0]mem[16];
function new(base_pkt pkt1, mailbox dr2bfm,bfm2sb);

this.pkt1 = pkt1;
this.dr2bfm = dr2bfm;
this.bfm2sb = bfm2sb;
endfunction

task bf();
dr2bfm.get(pkt1);
mem[pkt1.addr1] = pkt1.data_in1;
mem[pkt1.addr2] = pkt1.data_in2;
//$display($time,":In bfm mem: value = %h",mem[pkt1.addr]); 
#16
pkt1.data_out1 = mem[pkt1.addr1];
pkt1.data_out2 = mem[pkt1.addr2];
bfm2sb.put(pkt1);

endtask

endclass

`endif