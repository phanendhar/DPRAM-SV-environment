`include "dpram_basepkt.sv"

`ifndef _dpram_driver_
`define _dpram_driver_

class driver;
base_pkt pkt1;
mailbox st2dr,dr2bfm;
virtual dpram_if intf;

function new(base_pkt pkt1, mailbox st2dr,dr2bfm,virtual dpram_if intf);

this.pkt1 = pkt1;
this.st2dr = st2dr;
this.dr2bfm = dr2bfm;
this.intf = intf;

endfunction

task drive;
st2dr.get(pkt1);
#4 pkt1.rst = 1'b0;
intf.rst = pkt1.rst;
pkt1.we1 = 1'b1;
intf.we1 = pkt1.we1;
pkt1.we2 = 1'b1;
intf.we2 = pkt1.we2;
intf.addr1 = pkt1.addr1;
intf.data_in1 = pkt1.data_in1;
intf.addr2 = pkt1.addr2;
intf.data_in2 = pkt1.data_in2;
dr2bfm.put(pkt1);
//$display($time,"setting we value to bfm");
@intf.cb;
@intf.cb1;
//$display($time,": Writing value to memory ");
//st2dr.get(pkt1);
#1 pkt1.we1 = 1'b0;
intf.we1 = pkt1.we1;
pkt1.we2 = 1'b0;
intf.we2 = pkt1.we2;
//dr2bfm.put(pkt1);
@intf.cb;
@intf.cb1;
//$display($time,": Reading the value of memory");
#1;
endtask

endclass 
`endif
