

module seg_dec (
    num,
    a_g
);
    input[3:0]  num;
    output[6:0] a_g;
    reg[6:0] a_g;
    always @(num) begin
        case (num)
        4'd0:a_g<=7'b111_1110;
        4'd1:a_g<=7'b011_0000;
        4'd2:a_g<=7'b110_1101;
        4'd3:a_g<=7'b111_1001;
        4'd4:a_g<=7'b011_0011;
        4'd5:a_g<=7'b101_1011;
        4'd6:a_g<=7'b101_1111;
        4'd7:a_g<=7'b111_0000;
        4'd8:a_g<=7'b111_1111;
        4'd9:a_g<=7'b111_1011;
            default: a_g<=7'b000_0001;
        endcase
    end

endmodule