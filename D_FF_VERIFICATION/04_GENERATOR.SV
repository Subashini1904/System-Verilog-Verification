class generator;
  transaction t;
  mailbox gen2drv;
  //event next;
  
  function new(mailbox gen2drv);
    this.gen2drv = gen2drv;
    endfunction
  
  task run();
    repeat(5) begin
        t = new();
        t.randomize();
        gen2drv.put(t);
        t.display("GEN");
       // @(next);
      t.check();
      end
  endtask
endclass
