# 4-bit Down-Counter in Verilog

## Overview

In this project, I implemented a 4-bit down-counter in Verilog using behavioral modeling. My goal was to create a circuit that decrements a 4-bit counter from 15 to 0 on each positive clock edge, with an asynchronous reset to clear the count. For example, if the counter is at 0101 (5), it becomes 0100 (4) on the next clock edge. I designed the counter with clock and reset inputs, and wrote a testbench to verify its functionality by testing reset and counting scenarios. I confirmed the design works as expected through simulation.

Module: down_counter





What I Did: I designed a 4-bit down-counter that decrements on each clock edge.



Inputs:





clk: Clock signal (positive edge-triggered).



reset: Asynchronous reset (active-low) to clear the counter.



Outputs:





count[3:0]: 4-bit counter output (15 to 0).



How It Works:





On the rising edge of clk or falling edge of reset, if reset=0, I set count=0 (asynchronous reset).



If reset=1, I decrement count by 1 (count <= count - 1) on each clock edge.



For example, if count=0011 (3) and reset=1, then count=0010 (2) after the clock edge.



Note: The counter wraps around from 0 to 15 (e.g., 0000 becomes 1111) due to unsigned arithmetic.



Style: Behavioral modeling with an always @(posedge clk or negedge reset) block.

Testbench: testbench





What I Did: I created a testbench to verify the 4-bit down-counter.



How It Works:





I defined clk and reset as inputs, and count[3:0] as the output.



I generated a clock with a 10ns period (forever #5 clk=~clk).



I applied the following sequence:





reset=0 for 10ns (resets count to 0).



reset=1 for 200ns (counts down).



I used $display triggered by changes in count to print clk, reset, and count.



Time Scale: I set 1ns / 1ps for precise simulation timing.



Purpose: The testbench verifies the counter resets to 0 and decrements correctly on each clock edge.

Files





down_counter.v: Verilog module for the 4-bit down-counter.



testbench.v: Testbench for simulation.


### Simulation Waveform

Below is the simulation waveform, showing inputs clk, reset, and output count[3:0] over time.
![Screenshot 2025-06-13 175517](https://github.com/user-attachments/assets/78bd0e43-8c76-4e81-9834-b638a7e60ff1)


### Console Output

Below is the console output from my testbench simulation.


![Screenshot 2025-06-13 175457](https://github.com/user-attachments/assets/0783a5e2-bc6e-4f13-b1fc-0412ee4c7551)






clk=0 reset=0 count=0000



clk=0 reset=1 count=1111



clk=1 reset=1 count=1110



clk=0 reset=1 count=1101



clk=1 reset=1 count=1100



... (continues decrementing for 200ns, i.e., 20 clock cycles)
