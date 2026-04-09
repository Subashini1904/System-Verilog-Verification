class transaction;
  rand bit a;
  rand bit b;
  rand bit cin;
  bit sum;
  bit cout;
  
  function void display(string name);
    $display("[%0s] a=%0b b=%0b cin=%0b sum=%0b cout=%0b", name, a, b, cin, sum, cout);
  endfunction
endclass
