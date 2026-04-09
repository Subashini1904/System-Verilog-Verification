class monitor;
  mailbox #(transaction) mon2scb;
  virtual fa_if vif;
  function new(mailbox #(transaction) mon2scb, virtual fa_if vif);
    this.mon2scb = mon2scb;
    this.vif = vif;
  endfunction
  task run();
    transaction t;
    forever begin
      t = new();
      #1;
      t.a=vif.a;
      t.b=vif.b;
      t.cin=vif.cin;
      t.sum=vif.sum;
      t.cout=vif.cout;
      mon2scb.put(t);
      t.display("MON");
    end
  endtask
endclass

   
