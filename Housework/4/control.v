`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/10/24 17:38:17
// Design Name: 
// Module Name: control
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


module control(clk,rst_n,start,en,flag);
parameter N  = 4;
input clk,rst_n,start;
output en,flag;

reg NS,PS;
reg [N-1:0] i;

always@(posedge clk or negedge rst_n)
begin
    if(!rst_n)
        PS<=1'b0;
    else 
        PS<=NS;
end

always@(start or flag)
begin
    if(start)
        NS=1'b1;
    else if(flag)
        NS=1'b0;
    else
        NS=PS;
end
 
always@(posedge clk or negedge rst_n)
begin
    if(!rst_n)
        i<=1;
    else if(start)
        i<=1;
    else if(en)
        i<=(i<<1);
    else
        i<=1;
end

assign en=PS;
assign flag=!(|i);
    
endmodule
