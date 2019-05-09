
# This file was *autogenerated* from the file ./3_1_1.sage
from sage.all_cmdline import *   # import sage library

_sage_const_0p9 = RealNumber('0.9'); _sage_const_0 = Integer(0); _sage_const_0p45 = RealNumber('0.45'); _sage_const_0p6 = RealNumber('0.6')#!/usr/local/bin/sage

x = var('x')

#f = (1 + x)^(1/2)
#f = cos(x)
#f = ln(x + 1)
f = tan(x)

x_0 = _sage_const_0 
x_1 = _sage_const_0p6 
x_2 = _sage_const_0p9 

y_0 = f(x_0)
y_1 = f(x_1)
y_2 = f(x_2)

c_0 = y_0
c_1 = (y_1 - y_0) / (x_1 - x_0)

p_1 = c_0 + c_1*(x - x_0)

c_2 = (y_2 - p_1(x_2)) / ((x_2 - x_0)*(x_2 - x_1))

p_2 = p_1 + c_2*(x - x_0)*(x - x_1)

print "<check>"
print p_1(x_0) - f(x_0)
print p_1(x_1) - f(x_1)
print p_2(x_0) - f(x_0)
print p_2(x_1) - f(x_1)
print p_2(x_2) - f(x_2)
print "------------------------"
print "f : " + str(f)
print "p_1 : " + str(p_1)
print "p_2 : " + str(p_2)
print "------------------------"
print "f(0.45) : " + str(f(_sage_const_0p45 ))
print "p_1(0.45) : " + str(p_1(_sage_const_0p45 ))
print "abs error : " + str(abs(f(_sage_const_0p45 ) - p_1(_sage_const_0p45 )))
print "p_2(0.45) : " + str(p_2(_sage_const_0p45 ))
print "abs error : " + str(abs(f(_sage_const_0p45 ) - p_2(_sage_const_0p45 )))
