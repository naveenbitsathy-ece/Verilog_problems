module addition_tb();
reg [n-1:0]inp1,inp2;
wire [n-1:0]inv;
wire [n:0]out;
wire [n-1:0]out1;
parameter n=7;
addition uut(inp1,inp2,inv,out,out1);

initial 
begin
    inp1=7'b1011100;
    inp2=7'b1010011; 
end 
initial 
begin 
$monitor("inp1=%b inp2=%b out1=%b",inp1,inp2,out1);
end 
endmodule 