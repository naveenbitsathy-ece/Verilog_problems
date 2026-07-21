module addition_tb();
reg [n-1:0]inp1,inp2;

wire [n-1:0]out;


reg [n-1:0]expec_sum;
integer i;
integer j;
parameter n=7;
addition uut(inp1,inp2,out);

initial 
begin


for(i=0;i<7;i=i+1)
 { inp1 }= i;
#0;
for(j=7;j<0;j=j-1)
 { inp2 }= j;

expec_sum = inp1 + (~inp2 + 1'b1);
$display("expec_sum=%b",expec_sum);
#0;

if(expec_sum == out)
$display("pass");
else 
$display("fail");
end

// initial 
// begin 
// $monitor("inp1=%b inp2=%b out=%b",inp1,inp2,out);
// end 
endmodule 