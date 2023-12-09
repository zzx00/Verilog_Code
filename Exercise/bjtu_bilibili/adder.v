
//四位加法器
module adder (
    A,
    B,
    cout,
    S
);
    input[3:0]  A ;
    input[3:0]  B;
    output cout;
    output[3:0] S ; 

    wire cout;
    wire[3:0] S;

    assign {cout,S}=A+B;



endmodule