
`timescale 1ns/10ps
module fn_sw (
    a,
    b,
    sel,
    y 
);
input a;
input b;
input sel;
output y;
assign y=sel?(a^b):(a&b);
endmodule

/*
//使用always语句块
module fn_sw (
    a,
    b,
    sel,
    y
);
input a;
input b;
input sel;
output y;
reg y;
//过程语句中（always，initial），被赋值的变量定义为variable型（reg）
always @(a or b or sel) begin //敏感变量，是组合逻辑的输入，使用或
    if(sel==1) begin
        y<=a^b;
        //对reg型变量进行赋值时要使用带箭头的等号
    end
    else begin
        y<=a&b;
    end
end
    
endmodule

*/

module fn_sw_tb;
reg aa,bb,ss;
wire yy;
fn_sw fn_sw (
    .a(aa),
    .b(bb),
    .sel(ss),
    .y(yy) 
);
    initial begin
        aa<=0;bb<=0;ss<=0;
        #10 aa<=0;bb<=0;ss<=1;
        #10 aa<=0;bb<=1;ss<=0;
        #10 aa<=0;bb<=1;ss<=1;
        #10 aa<=1;bb<=0;ss<=0;
        #10 aa<=1;bb<=0;ss<=1;
        #10 aa<=1;bb<=1;ss<=0;
        #10 aa<=1;bb<=1;ss<=1;
        #10 $stop;
        
    end
endmodule

/*
initial begin
    absel<=0;
    #200 $stop;
end
always #10 absel<=absel+1;//每过10ns自动加一
*/