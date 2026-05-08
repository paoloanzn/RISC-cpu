.option norelax
main:
  # basic: 1 << 3 = 8
  addi x1, x0, 1
  slli x2, x1, 3
  # left shift by 0: x << 0 = x
  addi x3, x0, 0xCD
  slli x4, x3, 0
  # large shift: 1 << 31
  slli x5, x1, 31
  # shift by 63 (top bit): 1 << 63
  slli x6, x1, 63
  # Build 0xFFFF then shift: 0xFFFF << 16 = 0xFFFF0000
  addi x8, x0, 0xFF
  slli x9, x8, 8
  ori x9, x9, 0xFF            # x9 = 0xFFFF
  slli x10, x9, 16            # x10 = 0xFFFF0000
  # shift then mask overflow: 0x8000000000000000 << 1 wraps to 0 in 64 bits
  addi x11, x0, 1
  slli x12, x11, 63           # x12 = 0x8000000000000000 (negative)
  slli x13, x12, 1            # x13 = 0 (overflow, masked)
# expect x1=1, x2=8, x3=0xCD, x4=0xCD, x5=0x80000000, x6=0x8000000000000000, x8=0xFF, x9=0xFFFF, x10=0xFFFF0000, x11=1, x12=0x8000000000000000, x13=0