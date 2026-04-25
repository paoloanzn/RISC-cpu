main:
  auipc x5, 0             # x5 = 0 + 0 = 0
  auipc x6, 1             # x6 = 4 + 0x1000 = 0x1004
  auipc x7, 2             # x7 = 8 + 0x2000 = 0x2008
# expect x5=0, x6=0x1004, x7=0x2008