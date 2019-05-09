
# This file was *autogenerated* from the file ./2_2_2.sage
from sage.all_cmdline import *   # import sage library

_sage_const_3 = Integer(3); _sage_const_2 = Integer(2); _sage_const_1 = Integer(1); _sage_const_0 = Integer(0); _sage_const_4 = Integer(4)#!/usr/local/bin/sage

def iterate_func(f, v, num):
  try:
    f = f._fast_float_(f.variables()[_sage_const_0 ])
  except AttributeError:
    pass
  print "iter :", num
  print "v :", v
  print "f v :", f(v)
  if num == _sage_const_4 :
    return f(v)
  else:
    return iterate_func(f, f(v), num+_sage_const_1 )

x = var('x')
#f = (3 + x - 2*(x^2))^(1/4)
#f = ((x + 3 - (x^4)) / 2) ^ (1/2)
#f = ((x + 3) / ((x^2) + 2)) ^ (1/2)
#f = ((3*(x^4) + 2*(x^2) + 3) / (4*(x^3) + 4*x - 1))
#iterate_func(f, 1, 0)

f = (x**_sage_const_4 ) + _sage_const_2 *(x**_sage_const_2 ) - x - _sage_const_3 
print f.roots(x, ring=CC, multiplicities=False)

