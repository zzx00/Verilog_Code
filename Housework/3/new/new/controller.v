`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/10/17 10:59:28
// Design Name: 
// Module Name: controller
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


module controller(
input rstn,
input cin,//倒计时结束信号，高电平有效
input clk,
output reg [7:0]data,	//加载的数据输出
output reg [2:0]light,	//三位分别表示红绿黄
output reg load
);

reg [1:0] PS,NS;
parameter red=0,green=1,yellow=2;

always@(posedge clk or negedge rstn)begin
	if(!rstn)
		PS<=2'b0;
	else 
		PS<=NS;
end

always@(*)
begin
	if(cin)
	begin
	   case(PS)
	       red: NS=green;
	       green: NS=yellow;
	       yellow: NS=red;
	       default: NS=PS;
	    endcase
	 end
	 else NS=PS;	   
end

always@(*)
begin
    light=PS;
    case(NS)
        red: data=8'h30;
        green: data=8'h30;
        yellow: data=8'h5;
        default: data=data;
    endcase
 end  
 
 always@(*)
 begin
    if(cin)
        load=1'b1;
    else
        load=1'b0;
 end                  

endmodule