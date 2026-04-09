class driver;
  mailbox #(transaction) gen2drv;
  virtual fa_if vif;
  function new(mailbox #(transaction) gen2drv, virtual fa_if vif);
    this.gen2drv=gen2drv;
    this.vif=vif;
  endfunction
  task run();
    transaction t;
    forever begin
      gen2drv.get(t);
      vif.a<=t.a;
      vif.b<=t.b;
      vif.cin<=t.cin;
      #1;
      t.display("DRV");
    end
  endtask
  endclass
