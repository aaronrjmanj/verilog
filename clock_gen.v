/*Verilog code for clock generation having duty cycle, jitter and calculation
the timeperiod for the respective square wave or clock */

`timescale 10ns/1ns
module tb_clock_gen;
reg clk;
integer freq,duty_cycle,jitter;
real time_period,time_period_jitter;
real tp_cal,freq_cal;
realtime prev_clk_edge_time,curr_clk_edge_time;

	initial begin
         clk=0; curr_clk_edge_time=0;
	 forever begin
	  time_period=1000/freq; // Mhz
	  time_period_jitter=($urandom_range(100-jitter,100+jitter)/100.0)*time_period; //real division - range 90-110
	  clk=1; #((duty_cycle/100.0)*time_period_jitter);//delay
	  clk=0; #(((100-duty_cycle)/100.0)*time_period_jitter);//delay
  end end
	 initial begin
	  if(!$value$plusargs("freq=%d",freq)) begin // if not user gives input take the default input below
		  freq=100;
	  end
	  if(!$value$plusargs("duty_cycle=%d",duty_cycle)) begin // if not user gives input take the default input below
	 	 duty_cycle=50; // normal clock 50% 1 50% 0
	  end
	  if(!$value$plusargs("jitter=%d",jitter)) begin // if not user gives input take the default input below
             jitter=5;
	  end
	  #1000; $finish;
        end


	//to display 
  always@(posedge clk) begin
	  prev_clk_edge_time=curr_clk_edge_time;
	  curr_clk_edge_time=$time;
          tp_cal=curr_clk_edge_time-prev_clk_edge_time; // ns
	  //freq_cal = 1/number*ns = 10**9/number Hz => convert to MHz(divide by 10**6) = 1000/number
          freq_cal=1000/tp_cal; //MHz
	  $display("freq=%fMhz",freq_cal);
  end
	
endmodule

/*-------------------------------------------------------------------------------------------------------------------------------------------------

ModelSim/QuestaSim commands to give inputs
 vlib work
 vlog clock_gen.v
 vsim -novopt work.tb_clock_gen +freq=100 +duty_cycle=50 +jitter=10
 add wave sim:/tb_clock_gen/*
 run -all

*/ 
