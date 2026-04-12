`include "package.sv"
`include "interface.sv"
`include "test.sv"
module tb;
  logic clk = 0;
  always #5 clk = ~clk;
  mem_if vif(clk);
  simple_ram dut (
    .clk(clk),
    //.rst(vif.rst),
    .we(vif.we),
    .addr(vif.addr),
    .wdata(vif.wdata),
    .rdata(vif.rdata)
  );

  test t;
  initial begin
    t = new(vif);
    t.run();
    #100;
    $finish;
  end

  initial begin
    $dumpfile("mem.vcd");
    $dumpvars(0, tb);
  end
endmodule
