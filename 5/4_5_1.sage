#!/usr/local/bin/sage

# A slight modification in algorithm 4.2 in textbook

# a
f = (x^2)*(e^(-x))
a = 0
b = 1

# b
#f = (x^2)*ln(x)
#a = 1
#b = 1.5

h = b - a
R = [((h / 2)*(f(a) + f(b))).n()]

# to add end condition
prev = 0.0

for i in xrange(9):
  print (i + 1), ":", R[i]
  
  if i > 0 and abs(R[i] - prev) < 10^(-6): # end condition
    print "done : ", (i + 1)
    print "exact val : ", numerical_integral(f, a, b)
    print "abs error : ", abs(numerical_integral(f, a, b)[0] - R[i])
    break
  
  prev = R[i]
  
  res = 0.0
  for k in xrange(1, 2**i + 1):
    res += f(a + (k - 0.5)*h).n()
  R2 = [((1/2)*(R[0] + h * res)).n()]
  
  for j in xrange(1, i + 2):
    R2.append(R2[j - 1] + (R2[j - 1] - R[j - 1]) / (4^(j) - 1))
  
  h = h / 2
  R = R2

