class generator;
  transaction t;
  mailbox gen2drv;
  
  function new(mailbox gen2drv);
    this.gen2drv = gen2drv;
  endfunction
  
  task run();
    repeat(10) begin
      t = new();
      void'(t.randomize());
      gen2drv.put(t);
      t.display("GEN");
      t.check();
    end
  endtask
endclass
