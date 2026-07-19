module rev_tb();
 reg clk,rst;
 reg [n-1:0]data_in;
wire  [n-1:0]data_out;
parameter n=7;
  rev uut (clk,rst,data_in,data_out);

  initial 
  clk=0;
  always #5 clk =~ clk;

  initial 
  begin
    rst=1;
    #10;
    rst=0;
    data_in = 7'b1010001; 
    #100;
    $finish;
  end 
  initial 
  begin
    $monitor("Time=%0t rst=%b data_in=%b data_out=%b",
    $time,rst,data_in,data_out); 
  end 
endmodule 