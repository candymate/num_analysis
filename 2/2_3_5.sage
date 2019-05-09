#!/usr/local/bin/sage

def newton_method(f, ff, v, tol, num):
  nv = v - (f(v) / ff(v))
  print "iter :", num
  print "v :", pari(v)
  print "nv :", pari(nv)
  print "f v :", pari(f(v))
  print "precision :", pari(nv - v)
  if num == 10:
    return nv
  if abs(nv - v) < tol:
    return nv
  else:
    return newton_method(f, ff, nv, tol, num+1)

import warnings
warnings.filterwarnings("ignore", category=DeprecationWarning)

x = var('x')

#f = x - 0.8 - 0.2*sin(x)
#f = x^3 + 3*x^2 - 1
#f = x - cos(x)
f = x^3 - 2*x^2 - 5

ff = f.diff(x)

#res = newton_method(f, ff, pi/4, 10^(-4), 1)
#res = newton_method(f, ff, -2.5, 10^(-4), 1)
#res = newton_method(f, ff, pi/4, 10^(-4), 1)
res = newton_method(f, ff, 2.5, 10^(-4), 1)

print "final f v :", pari(f(res))
