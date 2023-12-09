//2023-10-21
//与非门
`timescale 1ns/10ps
module nand_gate (
    A,
    B,
    Y
);
    input  A;
    input  B;
    output Y;
    
    assign Y=~(A&B);

endmodule



//testbench
module nand_gate_tb ;
    reg aa,bb;
    wire yy;
    nand_gate nand_gate (
        .A(aa),
        .B(bb),
        .Y(yy)
    );
    initial begin
        aa<=0;bb<=0;//带箭头的是非阻塞型，会有延时
        //非阻塞赋值语句不对后面的赋值产生影响，等过程块执行完，所有赋值同时完成
        #10 aa<=0;bb<=1;
        #10 aa<=1;bb<=0;
        #10 aa<=1;bb<=1;
        #10 $stop;
    end

endmodule