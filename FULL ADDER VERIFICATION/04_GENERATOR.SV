class generator;
  transaction t;
  mailbox #(transaction) gen2drv;
  function new(mailbox #(transaction) gen2drv);
    this.gen2drv = gen2drv;
  endfunction
  task run();
    //transaction t;
    repeat (10) begin
      t=new();
      t.randomize();
      gen2drv.put(t);
      t.display("GEN");
    end
  endtask
endclass

     
