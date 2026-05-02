.option norelax
main:
  # basic: 0x0F ^ 0x33 = 0x3C
  addi x1, x0, 0x0F
  xori x2, x1, 0x33
  # with zero: x ^ 0 = x
  addi x3, x0, 0xAB
  xori x4, x3, 0
  # x ^ x = 0 (via same-value immediate)
  xori x5, x3, 0xAB
  # negative: 0xFF ^ 0xFF = 0 (12-bit sign-extended, 0xFF = 255)
  addi x6, x0, 0xFF
  xori x7, x6, 0xFF
  # negative immediate: -1 ^ 0x0F = 0xFFFFFFFFFFFFFFF0
  addi x8, x0, -1
  xori x9, x8, 0x0F
# expect x1=0x0F, x2=0x3C, x3=0xAB, x4=0xAB, x5=0, x6=0xFF, x7=0, x8=-1, x9=-16