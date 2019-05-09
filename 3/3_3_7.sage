#!/usr/local/bin/sage

x = var('x')
###################################
# problem 3.3.7
#x_val = [-0.1, 0, 0.2, 0.3]
#y_val = [5.3, 2, 3.19, 1]

#x_val = [-0.1, 0, 0.2, 0.3, 0.35]
#y_val = [5.3, 2, 3.19, 1, 0.97260]
###################################

################################
# problem 3.3 10
x_val = [-2, -1, 0, 1, 2, 3]
y_val = [1, 4, 11, 16, 13, -4]
################################

iter = 1
buf_1 = y_val
buf_2 = []
res = []

while len(buf_1) > 0:
  print buf_1
  buf_2 = []
  res += [buf_1[0]]
  for i in xrange(len(buf_1) - 1):
    buf_2 += [(buf_1[i+1] - buf_1[i])/(x_val[i+iter] - x_val[i])]
  iter += 1
  buf_1 = buf_2

print "-----------------------------"
print res

