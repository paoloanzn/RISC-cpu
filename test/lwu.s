main:
  addi x5, x0, 0x100
  addi x6, x0, -1
  sw x6, 0(x5)
  lwu x7, 0(x5)
# expect x7=4294967295
