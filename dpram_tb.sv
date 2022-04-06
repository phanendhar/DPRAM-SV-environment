`include "dpram_basepkt.sv"
`include "dpram_stimuli.sv"
`include "dpram_driver.sv"
`include "dpram_bfm.sv"
`include "dpram_monitor.sv"
`include "dpram_scoreboard.sv"
`include "dpram_coverage.sv"

program dpram_tb(dpram_if.TB intf);
base_pkt pkt1,pkt2;
stimulus st;
driver drv;
bfm b;
monitor mon;
scoreboard sco;
mailbox st2dr,dr2bfm,bfm2sb,m2sb,m2cv;
dpram_cov cc;
initial
begin
pkt1=new();
pkt2=new();
st2dr=new();
dr2bfm=new();
bfm2sb=new();
m2sb=new();
m2cv=new();
cc=new(pkt2,m2cv);
st=new(pkt1,st2dr);
drv=new(pkt1,st2dr,dr2bfm,intf);
b=new(pkt1,dr2bfm,bfm2sb);
mon=new(pkt2,m2sb,m2cv,intf);
sco=new(pkt1,pkt2,bfm2sb,m2sb);
end

initial
repeat(10)
fork
st.st_gen();
drv.drive();
b.bf();
mon.mon_check();
sco.score();
cc.run();
join

endprogram 