class driver;
  mailbox gen2drv;
  virtual dff_if vif;
  
  
  function new( mailbox gen2drv, virtual dff_if vif);
    this.gen2drv = gen2drv;
    this.vif = vif;
  endfunction
  
  task run();
    transaction t;
    forever begin
      gen2drv.get(t);
      vif.rst <= t.rst;
      vif.d   <= t.d;
      @(vif.cb);
      t.display("drv");
    end
  endtask
endclass
      
