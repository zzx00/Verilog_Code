`timescale 100us / 100us
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/10/16 16:28:56
// Design Name: 
// Module Name: tb
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


module tb(
    );
reg clk,rstn,en;
wire [6:0] high_seg,low_seg;
wire [1:0] light;


top top0(.clk(clk),.rstn(rstn),.en(en),.high_seg(high_seg),.low_seg(low_seg),.light(light));

initial
begin
    clk=1'b0;
    rstn=1'b1;
    en=1'b1;
    #10 rstn=1'b0;
    #100 rstn=1'b1;
end

always #5 clk=~clk;

endmodule
