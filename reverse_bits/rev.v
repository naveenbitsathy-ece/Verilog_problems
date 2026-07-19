
module rev(
    input clk,
    input rst,
    input [n-1:0] data_in,
    output reg [n-1:0] data_out
);
parameter n=7;
integer i;

// always @(posedge clk)
// begin
//     if (rst)
//     begin
//         data_out <= 3'b000;
//     end
//     else
//     begin
//         for (i = n-1; i >= 0; i = i - 1)
//         begin
//             data_out[(n-1)-i] <= data_in[i];
//         end
//     end
// end

always @(*)
begin
    if (rst)
    begin
        data_out <= 3'b000;
    end
    else
    begin
        for (i = n-1; i >= 0; i = i - 1)
        begin
            data_out[(n-1)-i] <= data_in[i];
        end
    end
end
endmodule