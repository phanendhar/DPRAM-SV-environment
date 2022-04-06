`include "dpram_basepkt.sv"
`ifndef _dpram_cover_
`define _dpram_cover_
class dpram_cov;
base_pkt pkt2;
mailbox m2cv;
/*task coverg;
m2cv.get(pkt2);
$display("im from cover group:%d",pkt2.addr1);
endtask*/ 
covergroup dpram_cover;
ADDR1:coverpoint pkt2.addr1{
bins one={[0:100]};}
ADDR2:coverpoint pkt2.addr2{
bins two={[0:100]};}
a1a2:cross ADDR1,ADDR2;
DATA_in1:coverpoint pkt2.data_in1{
ignore_bins ignore1={9,8};
bins data={[6:10]};}
endgroup
function new(base_pkt pkt2,mailbox m2cv);
this.pkt2=pkt2;
this.m2cv=m2cv;
dpram_cover=new();
endfunction
task run;
begin
m2cv.get(pkt2);
dpram_cover.sample();
end
endtask
endclass
`endif