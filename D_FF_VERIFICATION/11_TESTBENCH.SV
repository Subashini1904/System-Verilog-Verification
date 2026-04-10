`include "interface.sv"
`include "test.sv"

module tb;
  logic clk = 0;
  always #5 clk = ~clk;
  dff_if vif(clk);
 
  d_ff dut(
    .clk(clk),
    .rst(vif.rst),
    .d(vif.d),
    .q(vif.q)
  );
  test t;
  initial begin
    t = new(vif);
    t.run();
    #100;
    $finish;
  end
  initial begin
    $dumpfile("dff.vcd");
    $dumpvars(0, tb);
  end
endmodule
    
