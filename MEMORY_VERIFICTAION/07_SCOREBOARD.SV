class scoreboard;
  mailbox mon2scb;
  bit [DATA_WIDTH-1:0] mem [0:(1<<ADDR_WIDTH)-1];

  function new(mailbox mon2scb);
    this.mon2scb = mon2scb;
  endfunction

  task run();
    transaction t;

    forever begin
      mon2scb.get(t);
      if (t.rst) begin
        foreach(mem[i])
          mem[i] = 0;
      end
      else begin
        if (t.we) begin
          mem[t.addr] = t.wdata;
        end
        else begin
          if (t.rdata === mem[t.addr])
            $display("PASS addr=%0d rdata=%0d", t.addr, t.rdata);
          else
            $display("FAIL addr=%0d rdata=%0d expected=%0d", t.addr, t.rdata, mem[t.addr]);
        end
      end
    end
  endtask
endclass
