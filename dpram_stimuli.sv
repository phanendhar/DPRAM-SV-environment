`include "dpram_basepkt.sv"

`ifndef _dpram_stimuli_
`define _dpram_stimuli_

class stimulus;

base_pkt pkt1;

mailbox st2dr;

function new(base_pkt pkt1,mailbox st2dr);

this.pkt1 = pkt1;
this.st2dr = st2dr;
//this.st2bfm = st2bfm;

endfunction

task st_gen();

void'(pkt1.randomize());
st2dr.put(pkt1);
//$display($time,": From stimulus to driver");
//st2bfm.put(pkt1);
endtask

endclass
`endif