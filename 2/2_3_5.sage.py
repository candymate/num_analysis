
# This file was *autogenerated* from the file ./2_3_5.sage
from sage.all_cmdline import *   # import sage library

_sage_const_3 = Integer(3); _sage_const_2 = Integer(2); _sage_const_1 = Integer(1); _sage_const_5 = Integer(5); _sage_const_2p5 = RealNumber('2.5'); _sage_const_4 = Integer(4); _sage_const_10 = Integer(10)#!/usr/local/bin/sage

def newton_method(f, ff, v, tol, num):
  nv = v - (f(v) / ff(v))
  print "iter :", num
  print "v :", pari(v)
  print "nv :", pari(nv)
  print "f v :", pari(f(v))
  print "precision :", pari(nv - v)
  if num == _sage_const_10 :
    return nv
  if abs(nv - v) < tol:
    return nv
  else:
    return newton_method(f, ff, nv, tol, num+_sage_const_1 )

import warnings
warnings.filterwarnings("ignore", category=DeprecationWarning)

x = var('x')

#f = x - 0.8 - 0.2*sin(x)
#f = x^3 + 3*x^2 - 1
#f = x - cos(x)
f = x**_sage_const_3  - _sage_const_2 *x**_sage_const_2  - _sage_const_5 

ff = f.diff(x)

#res = newton_method(f, ff, pi/4, 10^(-4), 1)
#res = newton_method(f, ff, -2.5, 10^(-4), 1)
#res = newton_method(f, ff, pi/4, 10^(-4), 1)
res = newton_method(f, ff, _sage_const_2p5 , _sage_const_10 **(-_sage_const_4 ), _sage_const_1 )

print "final f v :", pari(f(res))

