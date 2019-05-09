#!/usr/local/bin/sage

# default values setup
h = 0.25
a = 0
b = 2
n = (b - a) / h

x = var('x')

# function
f = (x ^ 2) * ln(x^2 + 1)

# composite trapezoidal rule
# just sum of trapezoidal rule
res = 0.0
for i in xrange(n):
  res += (h / 2) * (f(a + i * h) + f(a + (i + 1) * h))
print res

# composite simpson's rule
# just sum of simpson's rule
res = 0.0
for i in xrange(0, n, 2):
  res += (h / 3) * (f(a + i * h) + 4 * f(a + (i + 1) * h) + f(a + (i + 2) * h))
print res

# compoisite midpoint rule
res = 0.0
for i in xrange(0, n, 2):
  res += 2 * h * (f(a + (i + 1) * h))
print res

