`timescale 1ns/1ns

module test_multiplier;
parameter N = 4;

reg rstn;
reg clk;
reg start;
reg [N-1:0] a;
reg [N-1:0] b;
wire [2*N-1:0] p;
wire valid;
wire [2*N-1:0] m;
reg flag1;


task input_tb;
	input [N-1:0] a1;
	input [N-1:0] b1;
	begin	
		a=a1;
		b=b1;
		start=1'b1;
		# 10;
		start=1'b0;
		# 140;
	end
endtask

top top0(.clk(clk),.rst_n(rstn),.start(start),.a(a),.b(b),.out(p),.valid(valid));

always #5 clk=~clk;

initial
begin
	rstn=1'b0;
	clk=1'b0;
	start=1'b0;
	a=4'b0;
	b=4'b0;
	# 20;
	rstn=1'b1;
	# 100;
	input_tb(2,2);
	$stop;
end

assign m=a*b;

always @(a or b)
begin
		$display("The input are a=%d,b=%d",a,b);
end

always @(posedge valid)
	begin
		if(p==m)
			begin 
				flag1 <= 1'b0;
		        $display("The result is right");
			end
	    else
		    begin
			    flag1 <= 1'b1;
		        $display("The result is error,m=%d,p=%d",m,p);
		    end
    end 
endmodule