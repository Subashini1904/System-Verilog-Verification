`include "interface.sv"
`include "test.sv"

module top;
  fa_if vif();
  full_adder dut(
    .a(vif.a),
    .b(vif.b),
    .cin(vif.cin),
    .sum(vif.sum),
    .cout(vif.cout)
  );
  test t;
  initial begin
    t = new(vif);
    t.run();
    #100 $finish;
  end
  initial begin 
    $dumpfile("full_adder.vcd");
    $dumpvars(0,top);
  end
endmodule
  
