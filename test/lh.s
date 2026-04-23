main:
  addi x5, x0, 0x100
  sh x0, 0(x5)
  li x6, -1
  sh x6, 0(x5)
  lh x7, 0(x5)
# expect x7=-1
