#!/usr/local/bin/sage

# a
f = (x^2)*(e^(-x))
a = 0
b = 1

# b
#f = (x^2)*ln(x)
#a = 1
#b = 1.5

# n = 2
ri = [0.5773502692, -0.5773502692]
wi = [1, 1]

# n = 4
#ri = [0.8611363116, 0.3399810436, -0.3399810436, -0.8611363116]
#wi = [0.3478548451, 0.6521451549, 0.6521451549, 0.3478548451]

# calculation of guassian quadrature
res = 0.0
for i in xrange(len(ri)):
  res += wi[i]*f(((b-a)/2)*ri[i]+((b+a)/2))*((b-a)/2)

print res
print "exact val : ", numerical_integral(f, a, b)
print "abs error : ", abs(numerical_integral(f, a, b)[0] - res)

