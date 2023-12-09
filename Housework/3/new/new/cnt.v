`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/10/17 11:24:50
// Design Name: 
// Module Name: cnt
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


module cnt10(clk,rstn,en,load,data,out_data,cout);

input 	clk,rstn,en,load;
input		[7:0]data;
output reg	[7:0] out_data;
output reg	cout;

always@(posedge clk,negedge rstn)
    begin
	if(!rstn)begin
		out_data<=8'h30;
	end
	else if(en)
	begin
		if(load)
			out_data<=data;
		else if(out_data[3:0]==4'b0)
		  begin
		    out_data[7:4]<=out_data[7:4]-4'b1;
		    out_data[3:0]<=4'h9;
		  end
		else
		  out_data[3:0]<=out_data[3:0]-4'b1;
    end		
	end

always@(*)
begin
    if(!rstn)
        cout=1'b0;
    else if(out_data==8'b0)
        cout=1'b1;
    else
        cout=1'b0;
end
endmodule
