//带load端的寄存器

module dff_load (
    clk,
    rst_n,
    load,
    data,
    a,
    q
);
    input  clk ;
    input  rst_n ;
    input  load,data,a ;
    output q ;
    reg q;

    always @(posedge clk or negedge rst_n) begin
        if (~rst_n) begin
            q<=1'b0;
        end else if (load) begin
            q<=data;
        end else begin
            q<=a;
        end
    end
endmodule