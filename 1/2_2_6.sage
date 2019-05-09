#!/usr/local/bin/sage

def fixed_iter(g, v, tol, num):
  try:
    g = g._fast_float_(g.variables()[0])
  except AttributeError:
    pass
  print "iter :", num
  print "v :", v
  print "g v :", g(v)
  print "precision :", g(v) - v
  if num == 10:
    return g(v)
  if abs(g(v) - v) < tol:
    return g(v)
  else:
    return fixed_iter(g, g(v), tol, num+1)

x = var('x')
#f = (x^4) - 3*(x^2) - 3
#g = x - f
#g = ((1/3)*(x^4) - 3)^(1/2)
g = (3*(x^2) + 3)^(1/4)
fixed_iter(g, 1, 10^(-2), 0)

