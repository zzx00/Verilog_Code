//多路复用器

module mux_2 (
    a,
    b,
    sl,
    out
);
    
    input  a ;
    input  b ;
    input  sl ;
    output out ;
    reg out;


    always @(a or b or sl) begin//时序逻辑和组合逻辑区分：敏感列表有无时钟
        if (sl) begin
            out=a;
        end else begin
            out=b;
        end
    end



endmodule