//支持同步置数计数器

module counter_ten (
    counter,
    clk,
    rst_n
);

    input  clk ;
    input  rst_n;
    output [3:0] counter;

    reg[3:0] counter;

    always @(posedge clk) begin//因为是同步置数，所以敏感列表没有rst_n，只有在时钟上升沿按才有效
        if (~rst_n) begin//!和~的区别
            counter<=4'b0000;
        end else if (counter==4'd10) begin
            counter<=4'b0000;
        end else begin
            counter<=counter+1;
        end
    end//异步置数是指在任意时刻按都有效
    
endmodule 