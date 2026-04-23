main:
  addi x5, x0, 0x100
  sw x0, 0(x5)
  li x6, -1
  sw x6, 0(x5)
  lw x7, 0(x5)
# expect x7=-1
