# Synchronous FIFO
- reg_FIFO is a very simple FIFO implemented with registers
- BRAM_FIFO is a FIFO using Xilinx ips: BRAM (Block Random Access Memory) to store a huge amount of data and Accumulator, Adder/Subtractor (with latency is 2 clock cycle) to calculate the number of free-slots in FIFO with a high-speed clock (because of the bit size of read pointer and write pointer is very large). It provides some features and needs to be obeyed some constraints:
  - All of data must be already loaded into FIFO then we can push the data out.
  - Mark the position of read pointer when push data, and we can return read pointer to that position anytime.