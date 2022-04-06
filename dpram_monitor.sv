`include "dpram_basepkt.sv"

`ifndef _dpram_monitor_
`define _dpram_monitor_

class monitor;
base_pkt pkt2;
mailbox m2sb,m2cv;
virtual dpram_if intf;

function new(base_pkt pkt2, mailbox m2sb,m2cv, virtual dpram_if intf);

this.pkt2 = pkt2;
this.m2sb = m2sb;
this.intf = intf;
this.m2cv = m2cv;
endfunction

task mon_check;

@(intf.cb);
@intf.cb1;
#1;
@intf.cb;
@intf.cb1;
#1;
pkt2.data_out1 = intf.data_out1;
pkt2.data_out2 = intf.data_out2;
//$display($time,": From dut to mon and mon to sb");
m2sb.put(pkt2);
m2cv.put(pkt2);
endtask

endclass
`endif