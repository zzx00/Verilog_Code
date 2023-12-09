
module dff (
    clk,
    a,
    rst_n,
    d,
    q
);
    input clk,a,rst_n,d;
    output q;
    reg q; 

    always @(posedge clk ) begin
        if (~rst_n) begin
            q<=1'b0;
        end else begin
            q<=d;
        end
    end

    
endmodule