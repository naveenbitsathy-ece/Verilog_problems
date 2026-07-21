module addition(
input [n-1:0]inp1,inp2,
output [n-1:0]out
);
parameter n=7;
 
assign out = inp1 + (~inp2 + 1'b1);

endmodule 