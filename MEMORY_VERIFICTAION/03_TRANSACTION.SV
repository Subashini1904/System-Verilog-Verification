class transaction;
  rand bit rst;
  rand bit we;
  rand bit [ADDR_WIDTH-1:0] addr;
  rand bit [DATA_WIDTH-1:0] wdata;
  bit [DATA_WIDTH-1:0] rdata;
  static int txn_count;
  
  constraint c1 {
    if (txn_count < 2)
      rst == 1;
    else
      rst == 0;
  }

  function void display(string name);
    $display("[%s] rst=%0d we=%0d addr=%0d wdata=%0d rdata=%0d",
              name, rst, we, addr, wdata, rdata);
  endfunction

  function void check();
    txn_count++;
  endfunction
endclass
