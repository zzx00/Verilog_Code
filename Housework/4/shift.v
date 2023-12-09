`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/10/24 13:16:17
// Design Name: 
// Module Name: shift
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


module shift(clk,rst_n,en,start,a,b,a_o);
parameter N = 4;
input clk,rst_n,en,start;
input [N-1:0] a,b;
output [2*N-1:0] a_o;

reg [2*N-1:0] a_s;
reg [N-1:0] b_s;

always@(posedge clk or negedge rst_n)
begin
    if(!rst_n)
        a_s<=0;
    else if(start)
        a_s<=a;
    else if(en)
        a_s<=(a_s<<1);
    else
        a_s<=a_s;
end

always@(posedge clk or negedge rst_n)
begin
    if(!rst_n)
        b_s<=0;
    else if(start)
        b_s<=b;
    else if(en)
        b_s<=(b_s>>1);
    else
        b_s<=b_s;
end

assign a_o=b_s[0]?a_s:0;

endmodule
