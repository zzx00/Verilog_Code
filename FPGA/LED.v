
module flow_led (
    input  sys_clk ,
    input  rst_n ,
    output reg [3:0] LED
);
    reg [23:0] clock;

    always @(posedge sys_clk or negedge rst_n) begin
        if (!rst_n) begin
            clock<=24'b0;
        end else if(clock<24'd1000_0000) begin
            clock<=clock+1'b1;
        end else begin
            clock<=24'b0;
        end
    end

    always @(posedge sys_clk or negedge rst_n) begin
        
    end
    
endmodule