//一位全加器
module FA (
    a,
    b,
    cin,
    cout,
    c
);

    input  a ;
    input  b ;
    input  cin ;
    output cout ;
    output c ;

    wire c,cout;

    assign {cout,sum}=a+b+cin;
    
endmodule