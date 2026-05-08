.option norelax
main:
  # basic: -8 >> 1 = -4 (arithmetic preserves sign)
  addi x1, x0, -8
  srai x2, x1, 1
  # arithmetic shift by 0: x >> 0 = x
  addi x3, x0, -1
  srai x4, x3, 0
  # -1 >> 4 = -1 (arithmetic, sign-fill)
  srai x5, x3, 4
  # large negative: 0x8000000000000000 >> 2 = 0xE000000000000000
  addi x6, x0, 1
  slli x6, x6, 63             # x6 = 0x8000000000000000
  srai x7, x6, 2
  # positive value: 0x7FFFFFFFFFFFFFFF >> 2 = 0x1FFFFFFFFFFFFFFF
  addi x8, x0, -2
  srli x9, x8, 1              # x9 = 0x7FFFFFFFFFFFFFFF
  srai x10, x9, 2
# expect x1=-8, x2=-4, x3=-1, x4=-1, x5=-1, x6=0x8000000000000000, x7=0xE000000000000000, x8=-2, x9=0x7FFFFFFFFFFFFFFF, x10=0x1FFFFFFFFFFFFFFF