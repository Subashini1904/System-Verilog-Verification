
class scoreboard;
  mailbox mon2scb;
  int expected;
  
  function new(mailbox mon2scb);
    this.mon2scb = mon2scb;
    expected = 0;
  endfunction
  
  task run();
  transaction t;

  forever begin
    mon2scb.get(t);

    if (t.rst) begin
      expected = 0;
    end
    else begin
      if (t.count === expected)
        $display("PASS rst=%0d, count=%0d", t.rst, t.count);
      else
        $display("FAIL rst=%0d, count=%0d, expected=%0d", t.rst, t.count, expected);

      if (expected == N-1)
        expected = 0;
      else
        expected = expected + 1;
    end
  end
endtask
endclass
