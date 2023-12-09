`timescale 1ns/100ps
module detector_tb();

reg clk;
reg rst;
reg trigger;
//reg start;

wire [3:0] B;
wire[4:0] bits;
wire[18:0] cnt;

//detector inst(clk,rst,trigger,start,B,bits);
detector inst(clk,rst,trigger,cnt,B,bits);

initial begin
    clk<=0;
    rst<=0;
    trigger<=0;
 //   start<=0;
#10
    rst<=1;
#100
trigger<=1;
#10
trigger<=0;
#500
trigger<=1;
#10
trigger<=0;
#500
trigger<=1;
#10
trigger<=0;

#4000000
trigger<=1;
#10
trigger<=0;
end

always #0.5 clk<=~clk;
//always #4 trigger<=~trigger;



endmodule