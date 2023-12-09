

module count_1 (
    clk,
    res,
    y
);

    input  clk,res ;
    output[7:0] y ;
    reg [7:0] y;//y是触发器
    wire[7:0] sum;//加一运算的结果
//    assign sum=y+1;//组合逻辑部分
    always @(posedge clk or negedge res) begin
        if (~res) begin
            y<=0;
        end
        else begin
            //y<=sum;
            y<=y+1;
        end
    end
    
endmodule


module count_1_tb ;
    reg clk,res;
    wire[7:0] y;
    reg[7:0] sum;
    count_1 count_1 (
    .clk(clk),
    .res(res),
    .y(y)
);
initial begin
    clk<=0;res<=0;
    #17 res<=1;
    #6000 $stop;

end

always #5 clk<=~clk;
//生成时钟信号，初始使其为0，每隔5ns反一次，生成一个10ns的时钟周期
    
endmodule