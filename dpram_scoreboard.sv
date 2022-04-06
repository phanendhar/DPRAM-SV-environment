`include "dpram_basepkt.sv"

`ifndef _dpram_score_
`define _dpram_score_

class scoreboard;

base_pkt pkt1,pkt2;
mailbox bfm2sb,m2sb;

function new(base_pkt pkt1,pkt2, mailbox bfm2sb,m2sb);

this.pkt1 = pkt1;
this.pkt2 = pkt2;
this.bfm2sb = bfm2sb;
this.m2sb = m2sb;

endfunction

task score();
bfm2sb.get(pkt1);
m2sb.get(pkt2);

if((pkt1.data_out1 == pkt2.data_out1)&&(pkt1.data_out2==pkt2.data_out2))
$display(/*$time,*/": correct:: port1 storage info- %h : %0h && port2 storage info- %h : %0h",pkt1.data_out1,pkt2.data_out1,pkt1.data_out2,pkt2.data_out2);
else
$display(/*$time,*/": incorrect:: port1 storage info- %h : %0h && port2 storage info- %h : %0h",pkt1.data_out1,pkt2.data_out1,pkt1.data_out2,pkt2.data_out2);


endtask

endclass

`endif