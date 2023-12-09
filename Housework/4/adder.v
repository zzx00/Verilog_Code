`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/10/24 12:28:43
// Design Name: 
// Module Name: adder
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


module adder(clk,rst_n,start,a,b,flag);
parameter N=4;
input clk,rst_n,start,flag;
input [2*N-1:0] a;
output [2*N-1:0] b;

reg [2*N-1:0] b;

always@(posedge clk or negedge rst_n)
begin
    if(!rst_n)
        b<=0;
    else if(start)
        b<=0;
    else if(!flag)
        b<=a+b;
end
endmodule
