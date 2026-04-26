.option norelax
main:
  addi x3, x0, 0
  jal x1, target
  addi x3, x0, 1
target:
  addi x4, x0, 2
# expect x1=8, x3=0, x4=2
