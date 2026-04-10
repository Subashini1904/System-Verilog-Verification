class transaction;
  rand bit rst, d;
  bit q;
  static bit [3:0] count;
  
  constraint c1{
    if(count>1)
      rst == 0;
    else 
      rst == 1;
  }
  
  function void display(string name);
    $display("[%s] rst=%b d=%b q=%b", name , rst, d, q);
  endfunction
  
function void check();
  count++;
endfunction
endclass
