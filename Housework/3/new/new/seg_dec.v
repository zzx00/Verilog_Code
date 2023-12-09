`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/10/17 12:02:38
// Design Name: 
// Module Name: seg_dec
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


module seg_dec(
input [3:0] num,
output reg [6:0] a_g
);

always@(num)begin
	case(num)
    4'd0:begin a_g<=7'b111_1110;end
    4'd1:begin a_g<=7'b011_0000;end
    4'd2:begin a_g<=7'b110_1101;end
    4'd3:begin a_g<=7'b111_1100;end
    4'd4:begin a_g<=7'b011_0011;end
    4'd5:begin a_g<=7'b101_1011;end
    4'd6:begin a_g<=7'b101_1111;end
    4'd7:begin a_g<=7'b111_0000;end
    4'd8:begin a_g<=7'b111_1111;end
    4'd9:begin a_g<=7'b111_1011;end
    default:begin a_g<=7'b000_0001;end//num超出（0-9）时，用default统一处理，显示为中杠；
    endcase
	 
end

endmodule
