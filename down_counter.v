`timescale 1ns / 1ps

module down_counter(input clk,reset,output reg [3:0]count);
always @(posedge clk or negedge reset)
begin
if(!reset)
count<=0;
else
count<=count-1;
end
endmodule

module testbench();
reg clk,reset;
wire [3:0]count;
down_counter m1(clk,reset,count);
initial begin
clk=0;
forever #5 clk=~clk;
end
initial begin
reset=0;
#10;
reset=1;
#200;
$finish;
end
always @(count)
$display("clk=%d reset=%d count=%d",clk,reset,count);
endmodule
