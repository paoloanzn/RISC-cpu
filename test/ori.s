.option norelax
main:
  # basic: 0x0A | 0x30 = 0x3A
  addi x1, x0, 0x0A
  ori x2, x1, 0x30
  # with zero: x | 0 = x
  addi x3, x0, 0xCD
  ori x4, x3, 0
  # with 0xFF: 0xF0 | 0xFF = 0xFF
  addi x5, x0, 0xF0
  ori x6, x5, 0xFF
  # oring -1 with anything = -1 (all bits set)
  addi x7, x0, -1
  ori x8, x7, 0x123
  # negative immediate: 0x01 | -1 = -1 (immediate sign-extended to all 1s)
  addi x9, x0, 1
  ori x10, x9, -1
# expect x1=0x0A, x2=0x3A, x3=0xCD, x4=0xCD, x5=0xF0, x6=0xFF, x7=-1, x8=-1, x9=1, x10=-1