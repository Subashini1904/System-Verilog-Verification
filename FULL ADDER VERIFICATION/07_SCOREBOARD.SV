class scoreboard;
  mailbox #(transaction) mon2scb;
  function new(mailbox #(transaction)  mon2scb);
    this.mon2scb=mon2scb;
  endfunction
  task run();
    transaction t;
    bit exp_sum;
    bit exp_cout;
    forever begin
      mon2scb.get(t);
      //{exp_cout,exp_sum} = t.a + t.b + t.cin;
      exp_sum = t.a ^ t.b ^ t.cin;
      exp_cout = (t.a&t.b) || (t.b&t.cin) || (t.a&t.cin );
      if(t.sum == exp_sum && t.cout == exp_cout)
        $display("PASS a=%d, b=%d, cin=%d, sum=%d, cout=%d", t.a, t.b, t.cin, t.sum, t.cout);
      else
        $display("FAIL  a=%d, b=%d, cin=%d, sum=%d, cout=%d", t.a, t.b, t.cin,t.sum, t.cout);
      t.display("SCB");
    end
  endtask
endclass

      
