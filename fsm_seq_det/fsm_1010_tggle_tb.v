module fsm_1010_tggle_tb();
reg clk,rst;
reg seq;
wire out;

fsm_1010_tggle DUT(clk,rst,seq,out);

reg [2*8:1] string_state;   //To print state
integer j;

always@(*)
case(DUT.state) 
          4'b0000: string_state = "S0";
          4'b0001: string_state = "S1";
          4'b0010: string_state = "S2";
          4'b0011: string_state = "S3";
          4'b0100: string_state = "S4";
          4'b0101: string_state = "S5";
          4'b0110: string_state = "S6";
          4'b0111: string_state = "S7";
          4'b1000: string_state = "S8";
endcase 

initial clk=0;
always #10 clk =~ clk;

task reset;
begin
    @(negedge clk)
     rst = 1'b1;
    @(negedge clk)
     rst = 1'b0; 
end 
endtask 

task stimulus;
input i;
begin
    @(negedge clk)
     seq = i; 
end 
endtask 

initial 
begin
  reset();
  for(j=0;j<10;j=j+1)
  begin
    stimulus(1'b0);
    stimulus(1'b1); 
  end 
  stimulus(1'b0);
  stimulus(1'b0);
  stimulus(1'b1);
  stimulus(1'b0);
  stimulus(1'b1);
  stimulus(1'b0);
  stimulus(1'b0);
  stimulus(1'b1);
  stimulus(1'b0);
  stimulus(1'b0);
  reset();
  stimulus(1'b0);
  stimulus(1'b1);
  stimulus(1'b0);
  stimulus(1'b1);
  stimulus(1'b0);
  stimulus(1'b0);
  stimulus(1'b1);
  stimulus(1'b0);
#500;
$finish;
end 
initial 
begin
    $dumpfile("naveen.vcd");
    $dumpvars(0,fsm_1010_tggle_tb); 
end 
endmodule 