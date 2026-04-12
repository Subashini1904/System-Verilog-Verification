import tb_pkg::*;
interface mem_if(input logic clk);
  logic rst;
  logic we;
  logic [ADDR_WIDTH-1:0] addr;
  logic [DATA_WIDTH-1:0] wdata;
  logic [DATA_WIDTH-1:0] rdata;
  
  clocking cb @(posedge clk);
    default input #1step output #0;
    output rst, we, addr, wdata;
    input rdata;
  endclocking
  
  modport drv (clocking cb);
  modport mon (clocking cb);
endinterface
