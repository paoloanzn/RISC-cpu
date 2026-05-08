.option norelax
main:
  # basic: 0x0F & 0x33 = 0x03
  addi x1, x0, 0x0F
  andi x2, x1, 0x33
  # with zero: x & 0 = 0
  addi x3, x0, 0xAB
  andi x4, x3, 0
  # with -1 (all 1s): x & -1 = x
  andi x5, x3, -1
  # negative register: -1 & 0x55 = 0x55
  addi x6, x0, -1
  andi x7, x6, 0x55
  # negative immediate: 0xFF | -8 = 0xFF & 0xFFFFFFFFFFFFFFF8
  addi x8, x0, 0xFF
  andi x9, x8, -8
# expect x1=0x0F, x2=0x03, x3=0xAB, x4=0, x5=0xAB, x6=-1, x7=0x55, x8=0xFF, x9=0xF8