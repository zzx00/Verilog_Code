`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/10/16 16:16:10
// Design Name: 
// Module Name: divider
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


module div(clk,rstn,clk_1Hz);
input clk,rstn;
output clk_1Hz;

reg clk_1Hz;
reg [8:0] cnt;

always@(posedge clk or negedge rstn)
begin
if(!rstn)
    begin
    cnt<=10'b0;
    clk_1Hz<=1'b1;
    end
else if(cnt==10'd499)
    begin
    cnt<=10'b0;
    clk_1Hz<=~clk_1Hz;
    end
else
    cnt<=cnt+1'b1;
end

endmodule
