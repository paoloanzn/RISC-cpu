main:
  addi x5, x0, 0x100
  sd x0, 0(x5)
  li x6, -1
  sd x6, 0(x5)
  ld x7, 0(x5)
# expect x7=-1
