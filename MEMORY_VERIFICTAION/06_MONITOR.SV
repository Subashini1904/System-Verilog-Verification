class monitor;
  mailbox mon2scb;
  virtual mem_if vif;

  function new(mailbox mon2scb, virtual mem_if vif);
    this.mon2scb = mon2scb;
    this.vif = vif;
  endfunction

  task run();
    transaction t;
    forever begin
      t = new();
      @(vif.cb);
      #1;
      t.rst   = vif.rst;
      t.we    = vif.we;
      t.addr  = vif.addr;
      t.wdata = vif.wdata;
      t.rdata = vif.rdata;
      mon2scb.put(t);
      t.display("MON");
    end
  endtask

endclass
