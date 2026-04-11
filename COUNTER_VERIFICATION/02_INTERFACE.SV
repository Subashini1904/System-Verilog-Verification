import tb_pkg::*;
interface counter_if(input logic clk);
  logic rst;
  logic [WIDTH-1:0] count;
  
  clocking cb @(posedge clk);
    default input #1step output #0;
    output rst;
    input count;  
  endclocking
  
  modport drv (clocking cb);
  modport mon (clocking cb);
endinterface
