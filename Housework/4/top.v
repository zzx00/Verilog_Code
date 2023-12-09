`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/10/24 18:36:54
// Design Name: 
// Module Name: top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module top(clk,rst_n,start,a,b,out,valid);
parameter N = 4;

input clk,rst_n,start;
input [N-1:0] a,b;

output [2*N-1:0] out;
output valid;

wire en;
wire [2*N-1:0] a_o;

control control0(.clk(clk),.rst_n(rst_n),.start(start),.en(en),.flag(valid));
shift shift0(.clk(clk),.rst_n(rst_n),.start(start),.en(en),.a(a),.b(b),.a_o(a_o));
adder adder0(.clk(clk),.rst_n(rst_n),.start(start),.a(a_o),.b(out),.flag(valid));

endmodule
