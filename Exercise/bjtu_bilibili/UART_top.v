`timescale 1ns/10ps
module UART_top (
    clk,
    res,
    RX,
    TX
);

    input  clk ;
    input  res ;
    input  RX;
    output TX ;
    //在封装一个顶层的时候，信号之间不管对谁来说全是连着的线
    //除了连接之外没有一句语句在里面
    //中间变量全是连接关系，所以全定义成wire
    wire[7:0] din_pro,dout_pro;
    wire en_din_pro,en_dout_pro,rdy;

    UART_RXer UART_RXer (
        .clk(clk),
        .res(res),
        .RX(RX),
        .data_out(din_pro),
        .en_data_out(en_din_pro)
     );

    UART_TXer UART_TXer (
    .clk(clk),
    .res(res),
    .data_in(dout_pro),
    .en_data_in(en_dout_pro),
    .TX(TX),
    .rdy(rdy)
    );

    cmd_pro cmd_pro (
    .clk(clk),
    .res(res),
    .din_pro(din_pro),
    .en_din_pro(en_din_pro),
    .dout_pro(dout_pro),
    .en_dout_pro(en_dout_pro),
    .rdy(rdy)
);
    
endmodule



module UART_top_tb ;
    reg clk,res;
    wire RX;
    wire TX;
    reg[45:0] RX_send;//里面装有串口字节发送数据
    assign RX=RX_send[0];
    reg[12:0] con;
    UART_top UART_top (
    clk,
    res,
    RX,
    TX
    );


    initial begin
        clk<=0;res<=0;RX_send<={1'b1,8'h09,1'b0,1'b1,8'h06,1'b0,1'b1,8'h0a,1'b0,16'hffff};con<=0;
        #17 res<=17;
        #4000000 $stop;
    end

    always #5 clk<=~clk;

    always @(posedge clk ) begin
        if (con==5000-1) begin
            con<=0;
        end else begin
            con<=con+1;
        end

        if (con==0) begin
            RX_send[44:0]<=RX_send[45:1];
            RX_send[45]<=RX_send[0];
        end

    end


    
endmodule