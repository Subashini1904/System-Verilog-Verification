class driver;
  mailbox gen2drv;
  virtual mem_if vif;

  function new(mailbox gen2drv, virtual mem_if vif);
    this.gen2drv = gen2drv;
    this.vif = vif;
  endfunction

  task run();
    transaction t;
    forever begin
      gen2drv.get(t);
      vif.cb.rst   <= t.rst;
      vif.cb.we    <= t.we;
      vif.cb.addr  <= t.addr;
      vif.cb.wdata <= t.wdata;
      @(vif.cb);
      t.display("DRV");
    end
  endtask

endclass
