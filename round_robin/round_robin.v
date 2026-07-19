module round_robin(
 input clk,rst,
 input [1:0]request,
 output [1:0]grant
);
always@(posedge clk)
begin 
    if(rst)
      grant <=0;
    else
    if(request == 4'b0000)
     grant <= 4'b0000;
     else if() 

end 
endmodule 