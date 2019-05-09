
# This file was *autogenerated* from the file ./4_7_1.sage
from sage.all_cmdline import *   # import sage library

_sage_const_0p3399810436 = RealNumber('0.3399810436'); _sage_const_2 = Integer(2); _sage_const_1 = Integer(1); _sage_const_0 = Integer(0); _sage_const_0p0 = RealNumber('0.0'); _sage_const_0p3478548451 = RealNumber('0.3478548451'); _sage_const_0p8611363116 = RealNumber('0.8611363116'); _sage_const_0p6521451549 = RealNumber('0.6521451549')#!/usr/local/bin/sage

# a
f = (x**_sage_const_2 )*(e**(-x))
a = _sage_const_0 
b = _sage_const_1 

# b
#f = (x^2)*ln(x)
#a = 1
#b = 1.5

# n = 2
#ri = [0.5773502692, -0.5773502692]
#wi = [1, 1]

# n = 4
ri = [_sage_const_0p8611363116 , _sage_const_0p3399810436 , -_sage_const_0p3399810436 , -_sage_const_0p8611363116 ]
wi = [_sage_const_0p3478548451 , _sage_const_0p6521451549 , _sage_const_0p6521451549 , _sage_const_0p3478548451 ]

res = _sage_const_0p0 
for i in xrange(len(ri)):
  res += wi[i]*f(((b-a)/_sage_const_2 )*ri[i]+((b+a)/_sage_const_2 ))*((b-a)/_sage_const_2 )

print res
print "exact val : ", numerical_integral(f, a, b)
print "abs error : ", abs(numerical_integral(f, a, b)[_sage_const_0 ] - res)

