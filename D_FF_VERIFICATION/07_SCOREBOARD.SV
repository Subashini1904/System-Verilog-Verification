class scoreboard;
  mailbox mon2scb;
  bit expected;
  
  function new(mailbox mon2scb);
    this.mon2scb = mon2scb;
  endfunction
  
  task run();
    transaction t;
    forever begin
      mon2scb.get(t);
      if(t.rst)
        expected = 0;
      else
        expected = t.d;
      if(t.q === expected)
        $display("PASS rst=%b, d=%b, q=%b", t.rst, t.d, t.q);
      else
        $display("FAIL rst=%b, d=%b, q=%b exp=%b", t.rst, t.d, t.q, expected);
    end
  endtask
endclass

      
