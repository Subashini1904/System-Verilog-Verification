`include "environment.sv"
class test;
  environment env;
  function new(virtual counter_if vif);
    env = new(vif);
  endfunction
  task run();
    env.run();
  endtask
endclass
