 //状态识别 连续收到15个1认为在空闲状态
 //找起始位的方法其实就是在找下降沿，将周期做一个时钟周期的延时，反向之后再和本身相与
`timescale 1ns/10ps

 module UART_RXer (
    clk,
    res,
    RX,
    data_out,
    en_data_out
 );
    input  clk ;
    input  res ;
    input  RX  ;
    output [7:0] data_out;
    output en_data_out ;
    reg[12:0] con;//用于计算比特宽度
    reg[3:0] con_bits;//用于计算比特数

    reg[7:0] state;//主状态机
    reg[7:0] data_out;
    reg RX_delay;//RX的延时
    reg en_data_out;

 always @(posedge clk or negedge res) begin
    if (~res) begin
        state<=0;con<=0;con_bits<=0;RX_delay<=0;data_out<=0;en_data_out<=0;
    end
    else begin
        RX_delay<=RX;
        case (state)
            0://等空闲
            begin
                en_data_out<=0;
                if(con==4999)begin
                    con<=0;
                end else begin
                    con<=con+1;
                end

                if (con==0) begin
                    if (RX) begin
                        con_bits<=con_bits+1;
                    end else begin
                        con_bits<=0;//表明在一个字节中间
                    end
                    
                end

                if (con_bits==12) begin
                    state<=1;
                end
            end 
            1://等起始位
            begin
                if (~RX&RX_delay) begin
                    state<=2;
                end
            end
            2://收最低位b0
            begin
                if (con==7500-1) begin
                    con<=0;
                    data_out[0]<=RX;
                    state<=3;
                end else begin
                    con<=con+1;
                end
            end
            3:
            begin
                if(con==5000-1) begin
                    con<=0;
                    data_out[1]<=RX;
                    state<=3;
                end else begin
                    con<=con+1;
                end
            end
            //4,5,6,7,8,9同理
            10://产生使能脉冲
            begin
                en_data_out<=1;
                state<=1;
            end
            default :
            begin
                state<=0;con<=0;con_bits<=0;en_data_out<=0;
            end
                
        endcase
    end
 end




 endmodule


 