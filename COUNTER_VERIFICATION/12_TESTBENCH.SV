`include "package.sv"
`include "interface.sv"
`include "test.sv"

module tb;
  logic clk = 0;
  always #5 clk = ~clk;
  counter_if vif(clk);
 
  mod_n_counter dut(
    .clk(clk),
    .rst(vif.rst),
    .count(vif.count)
  );
  test t;
  initial begin
    t = new(vif);
    t.run();
    #100;
    $finish;
  end
  initial begin
    $dumpfile("counter.vcd");
    $dumpvars(0, tb);
  end
endmodule
