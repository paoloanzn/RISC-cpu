main:
  addi x5, x0, 0x100
  li x6, 0xFF
  sb x6, 0(x5)
  lbu x7, 0(x5)
# expect x7=255
