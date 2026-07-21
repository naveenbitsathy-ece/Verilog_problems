module addition(
input [n-1:0]inp1,inp2,
output [n-1:0]inv,
output [n:0]out,
output [n-1:0]out1
);
parameter n=7;
 
assign inv = ~(inp2);
assign out = inp1 + inv;
assign out1 = out + out[n];
endmodule 