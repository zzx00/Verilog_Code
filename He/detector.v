module detector(
  input wire clk,
  input wire rst,
  input wire trigger,
  //input wire start,
  output wire [18:0]cnt,
  output wire [3:0] B,
  output wire [4:0] bits
);

reg[22:0] count; //400us
reg [3:0] rB;
reg [4:0] rbits;
reg [18:0] r_cnt;
assign B=rB;
assign bits=rbits;
reg trigger_p;
assign pose=trigger && !trigger_p;
assign cnt=r_cnt;

always@(posedge clk or negedge rst)begin
    if(!rst)
        trigger_p<=0;
    else
        trigger_p<=trigger;
end

always@(posedge clk or negedge rst)begin
    if(!rst)begin
        rB<=0;
        count<=0;
        r_cnt<=0;
    end else begin
        count<=count+1'b1;
        if(count%19'd399000==0)begin
            r_cnt<=0;
            rB<=count/19'd399000;
        end else begin
            rB<=count/19'd399000;
        end

        if(pose)
            r_cnt=r_cnt+1'b1;
        else ;
    end
end

always@(posedge clk or negedge rst)begin
    if(~rst)begin
        rbits<=5'h1f;
    end else begin
        if(count!=0 && (count%19'd399000)==0 && (cnt==0))
            rbits<=count/19'd399000 - 1'b1;
        else ;
    end
end

always@(posedge clk)begin
    if(count==23'd6399000)
        count<=0;
    else;
end



endmodule