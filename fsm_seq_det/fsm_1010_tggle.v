module fsm_1010_tggle(
input clk,rst,
input seq,
output wire out
);

parameter S0 = 4'b0000;
parameter S1 = 4'b0001;
parameter S2 = 4'b0010;
parameter S3 = 4'b0011;
parameter S4 = 4'b0100;
parameter S5 = 4'b0101;
parameter S6 = 4'b0110;
parameter S7 = 4'b0111;
parameter S8 = 4'b1000;

          reg [3:0]state,next_state;

always@(posedge clk or posedge rst)
        if(rst)
           state <= S0;
        else 
           state <= next_state;

always@(*)
begin
    next_state = S0;
    case(state)
 S0:if(seq)
  next_state <= S1;
 else 
  next_state <= S0;

 S1:if(seq)
  next_state <= S1;
 else 
  next_state <= S2;

 S2:if(seq)
  next_state <= S3;
 else 
  next_state <= S0;

 S3:if(seq)
  next_state <= S1;
 else 
  next_state <= S4;

 S4:if(seq)
  next_state <= S5;
 else 
  next_state <= S6;

 S5:if(seq)
  next_state <= S7;
 else 
  next_state <= S2;

 S6:if(seq)
  next_state <= S7;
 else 
  next_state <= S6;

 S7:if(seq)
  next_state <= S7;
 else 
  next_state <= S8;

 S8:if(seq)
  next_state <= S5;
 else 
  next_state <= S6;

endcase 
end 

assign out =((state == S4) ||(state == S5) 
||(state == S6) ||(state == S7) || (state == S8));

endmodule 