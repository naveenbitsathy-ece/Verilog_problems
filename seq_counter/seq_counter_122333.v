
// Counter 1 ----> 2 ----> 2 ----> 3 ----> 3 ----> 3;

module seq_counter_122333(
input clk,
input rst,
output reg [1:0]out
);
reg [2:0]counter;
parameter  STATE1 =4'b0001 ;
parameter  STATE2 =4'b0010 ;
parameter  STATE3 =4'b0110 ;
parameter  STATE4 =4'b0011 ;
parameter  STATE5 =4'b0111 ;
parameter  STATE6 =4'b1011 ;

always@(posedge clk)
begin
    if(rst)
    begin 
       // $display("rst=%b",rst);
    counter <= 3'd0;
    out <= 0;
    end 
    else if(counter == 5)
    counter <= 0;
    else
    counter <= counter + 1'b1; 

end 
           always@(posedge clk)
           begin
              if(counter == 0)
                out <= STATE1[1:0];
                else if(counter == 1)
                out <= STATE2[1:0];
                else if(counter == 2)
                out <= STATE3[1:0];
                else if(counter == 3)
                out <= STATE4[1:0];
                else if(counter == 4)
                out <= STATE5[1:0];
                else if(counter == 5)
                out <= STATE6[1:0];
           end 
endmodule 