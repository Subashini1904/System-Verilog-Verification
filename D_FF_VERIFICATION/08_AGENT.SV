`include "generator.sv"
`include "driver.sv"
`include "monitor.sv"
class agent;
  generator gen;
  driver drv;
  monitor mon;
  mailbox  gen2drv;
  mailbox  mon2scb;
  function new(virtual dff_if vif);
    gen2drv=new();
    mon2scb=new();
    gen=new(gen2drv);
    drv=new(gen2drv,vif);
    mon=new(mon2scb,vif);
  endfunction
endclass

    
    
    
    
