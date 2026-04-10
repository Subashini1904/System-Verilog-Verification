class monitor;
  mailbox mon2scb ;
  virtual dff_if vif;
 
  
  function new(mailbox mon2scb, virtual dff_if vif);
    this.mon2scb = mon2scb;
    this.vif = vif;
  endfunction
  
  task run();
    transaction t;
    forever begin
      t = new();
      @(vif.cb);
      
      t.rst = vif.rst;
      t.d   = vif.d;
      t.q   = vif.q;
      mon2scb.put(t);
      t.display("MON");
    end
  endtask
endclass
