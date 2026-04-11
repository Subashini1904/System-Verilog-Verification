class transaction;
  rand bit rst;
  bit [WIDTH-1:0] count;
  static int txn_count;
  
  constraint c1{
    if(txn_count<2)
      rst == 1;
    else
      rst == 0;
  }

  function void display(string name);
    $display("[%s] rst=%b count=%0d", name, rst, count);
  endfunction
  
  function void check();
    txn_count++;
  endfunction
endclass
