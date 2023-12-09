//串口发送模块

module UART_TXer (
    clk,
    res,
    data_in,
    en_data_in,
    TX,
    rdy
);
    input  clk ;
    input  res ;
    input  [7:0] data_in;//准备发送的数据
    input  en_data_in ;//发送使能
    output TX ;
    output rdy ;//空闲标志，0表示空闲

    reg [3:0] state;//主状态机寄存器
    reg [9:0] send_buf;//发送寄存器
    assign TX=send_buf[0];//连接TX
    reg[12:0] con;//用于计算波特周期
    reg [9:0] send_flag;//用于判断右移结束
    reg rdy;//空闲标志，0表示空闲


    always @(posedge clk or negedge res) begin
        if (!res) begin
            state<=0;send_buf<=1;con<=0;send_flag<=10'b10_0000_0000;rdy<=0;
        end else begin
            case (state)
                0://等待使能信号
                begin
                    if (en_data_in) begin
                        send_buf={1'b1,data_in,1'b0};
                        state<=1;
                        rdy<=1;
                    end
                end 
                1://串口发送寄存器右移
                begin
                    if (con==5000-1) begin
                        con<=0;
                    end else begin
                        con<=con+1;
                    end
                    if (con==5000-1) begin
                        send_buf[8:0]<=send_buf[9:1];
                        send_flag[8:0]<=send_flag[9:1];
                    end 
                    if (send_flag[0]) begin
                        rdy<=0;
                        state<=0;
                    end
                    

                end

            endcase
        end
    end

endmodule
