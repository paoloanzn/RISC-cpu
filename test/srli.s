.option norelax
main:
  # basic: 8 >> 2 = 2
  addi x1, x0, 8
  srli x2, x1, 2
  # shift by 0: x >> 0 = x
  addi x3, x0, 0x7FF
  srli x4, x3, 0
  # shift out: 0xFF >> 12 = 0
  addi x5, x0, 0xFF
  srli x6, x5, 12
  # logical shift of negative value: -1 >> 4 = 0x0FFFFFFFFFFFFFFF (logical, zero-fill)
  addi x7, x0, -1
  srli x8, x7, 4
  # shift by 63: 0x8000000000000000 >> 63 = 1
  addi x9, x0, 1
  slli x9, x9, 63             # x9 = 0x8000000000000000
  srli x10, x9, 63            # x10 = 1
# expect x1=8, x2=2, x3=0x7FF, x4=0x7FF, x5=0xFF, x6=0, x7=-1, x8=0x0FFFFFFFFFFFFFFF, x9=0x8000000000000000, x10=1