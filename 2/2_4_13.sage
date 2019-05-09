#!/usr/local/bin/sage

def fixed_iter(g, v, tol, num):
  print "iter :", num
  print "v :", v.n()
  print "g v :", g(v).n()
  print "precision :", (g(v) - v).n()
  if num == 20:
    return g(v)
  if abs(g(v) - v) < tol:
    return g(v)
  else:
    return fixed_iter(g, g(v).n(), tol, num+1)

x = var('x')

f = e^x - x - 1
ff = f.diff(x)
fff = ff.diff(x)

g_0 = x - (f(x) / ff(x))
#g_1 = x - (f(x)*ff(x)) / ((ff(x)^2) - f(x)*fff(x))
g_2 = x - (f(x) / ff(x)) - (fff(x) / (2*ff(x)))*((f(x) / ff(x))^2)

fixed_iter(g_0, 1, 10^(-4), 1)
#fixed_iter(g_1, 1, 10^(-6), 1)
fixed_iter(g_2, 1, 10^(-4), 1)

