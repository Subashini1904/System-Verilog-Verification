
module mod_n_counter #(
  parameter int N = 8,
  parameter int WIDTH = $clog2(N)
)(
  input  logic clk,
  input  logic rst,
  output logic [WIDTH-1:0] count
);

  always_ff @(posedge clk) begin
    if (rst)
      count <= 0;
    else if (count == N-1)
      count <= 0;
    else
      count <= count + 1;
  end

endmodule
