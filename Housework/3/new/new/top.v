`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/10/17 12:11:57
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


module top(clk,rstn,en,high_seg,low_seg,light);
input clk,rstn,en;
output [6:0] high_seg,low_seg;
output [1:0] light;

wire clk_1Hz;
wire cin;
wire [7:0] data;
wire load;
wire [7:0] out_data;

div div0(.clk(clk),.rstn(rstn),.clk_1Hz(clk_1Hz));

controller controller0(.clk(clk_1Hz),.rstn(rstn),.cin(cin),.data(data),.light(light),.load(load));

cnt10 cnt0(.clk(clk_1Hz),.rstn(rstn),.en(en),.load(load),.data(data),.out_data(out_data),.cout(cin));

seg_dec seg_dec0(.num(out_data[3:0]),.a_g(low_seg));
seg_dec seg_dec1(.num(out_data[7:4]),.a_g(high_seg));


endmodule
