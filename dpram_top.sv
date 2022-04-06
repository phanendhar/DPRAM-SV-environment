
module dpram_top();

bit clk;
always #5 clk = ~clk;
bit clk2;
always #5 clk2=~clk2;

dpram_if i_f(clk,clk2);
dpram_dut dut(i_f);
dpram_tb tb(i_f);


endmodule