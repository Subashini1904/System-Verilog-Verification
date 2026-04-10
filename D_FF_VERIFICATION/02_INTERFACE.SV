interface dff_if(input logic clk);
  logic rst;
  logic q;
  logic d;
  clocking cb @(posedge clk);
    default input #1step output #0;
    output rst,d;
    input q;
  endclocking
  modport drv(output rst, d, input q);
  modport mon(input rst, d, q);
endinterface
