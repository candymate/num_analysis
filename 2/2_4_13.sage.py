
# This file was *autogenerated* from the file ./2_4_13.sage
from sage.all_cmdline import *   # import sage library

_sage_const_2 = Integer(2); _sage_const_20 = Integer(20); _sage_const_10 = Integer(10); _sage_const_1 = Integer(1); _sage_const_4 = Integer(4)#!/usr/local/bin/sage

def fixed_iter(g, v, tol, num):
  print "iter :", num
  print "v :", v.n()
  print "g v :", g(v).n()
  print "precision :", (g(v) - v).n()
  if num == _sage_const_20 :
    return g(v)
  if abs(g(v) - v) < tol:
    return g(v)
  else:
    return fixed_iter(g, g(v).n(), tol, num+_sage_const_1 )

x = var('x')

f = e**x - x - _sage_const_1 
ff = f.diff(x)
fff = ff.diff(x)

g_0 = x - (f(x) / ff(x))
g_1 = x - (f(x)*ff(x)) / ((ff(x)**_sage_const_2 ) - f(x)*fff(x))
g_2 = x - (f(x) / ff(x)) - (fff(x) / (_sage_const_2 *ff(x)))*((f(x) / ff(x))**_sage_const_2 )

fixed_iter(g_0, _sage_const_1 , _sage_const_10 **(-_sage_const_4 ), _sage_const_1 )
#fixed_iter(g_1, 1, 10^(-6), 1)
fixed_iter(g_2, _sage_const_1 , _sage_const_10 **(-_sage_const_4 ), _sage_const_1 )


