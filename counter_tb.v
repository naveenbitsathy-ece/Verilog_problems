//`timescale 1ns/1ps

module counter_tb;

reg clk;
reg rst;

wire [1:0] out;

// Expected output
reg [3:0] expected_out;

// DUT
counter DUT(
    .clk(clk),
    .rst(rst),
    .out(out)
);

// Clock Generation
initial
    clk = 0;

always #5 clk = ~clk;

// Reset
initial
begin
    rst = 1;
    repeat(2) @(posedge clk);
    rst = 0;
end

// Self Checker

always @(posedge clk)
begin
    if(!rst)
    begin
        case(DUT.counter)
            0: expected_out = DUT.STATE1[1:0];
            1: expected_out = DUT.STATE2[1:0];
            2: expected_out = DUT.STATE3[1:0];
            3: expected_out = DUT.STATE4[1:0];
            4: expected_out = DUT.STATE5[1:0];
            5: expected_out = DUT.STATE6[1:0];
        endcase

        #1;

        if(out == expected_out)
            $display("PASS  Time=%0t  Counter=%0d  Output=%b",
                     $time, DUT.counter, out);
        else
            $display("FAIL  Time=%0t  Counter=%0d  Expected=%b  Actual=%b",
                     $time, DUT.counter, expected_out, out);
    end
end

//--------------------------------------------------
initial
begin
    #120;
    $display("Simulation Finished");
    $finish;
end

initial
begin
    $dumpfile("counter.vcd");
    $dumpvars(0,counter_tb);
end

endmodule