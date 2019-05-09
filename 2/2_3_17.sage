#!/usr/local/bin/sage

def newton_method(f, ff, v, tol, num):
  nv = v - (f(v) / ff(v))
  print "iter :", num
  print "v :", v.n()
  print "nv :", nv.n()
  print "f v :", (f(v)).n()
  print "precision :", (nv - v).n()
  if num > 20:
    return nv
  if abs(nv - v) < tol:
    return nv
  else:
    return newton_method(f, ff, nv.n(), tol, num+1)

def secant_method(f, v1, v2, tol, num):
  nv = v2 - (f(v2)*(v2 - v1)/(f(v2) - f(v1)))
  print "iter :", num
  print "v1 :", v1.n()
  print "v2 :", v2.n()
  print "nv :", nv.n()
  print "f nv :", (f(nv)).n()
  print "precision :", (nv - v2).n()
  
  if num > 20:
    return nv
  if abs(nv - v2) < tol:
    return nv
  else:
    return secant_method(f, v2.n(), nv.n(), tol, num + 1)

def false_position(f, v1, v2, tol, num):
  nv = v2 - f(v2)*(v2 - v1)/(f(v2) - f(v1))
  print "iter :", num
  print "v1 :", v1.n()
  print "v2 :", v2.n()
  print "nv :", nv.n()
  print "f nv :", (f(nv)).n()
  print "precision :", (nv - v2).n()
  
  if num > 20:
    return nv
  if abs(nv - v2) < tol:
    return nv
  if f(nv)*f(v2) < 0:
    return false_position(f, v2.n(), nv.n(), tol, num + 1)
  else:
    return false_position(f, v1.n(), nv.n(), tol, num + 1)

import warnings
warnings.filterwarnings("ignore", category=DeprecationWarning)

x = var('x')

f = 230*x^4 + 18*x^3 + 9*x^2 - 221*x - 9

ff = f.diff(x)

#try:
#  f = f._fast_float_(f.variables()[0])
#  ff = ff._fast_float_(ff.variables()[0])
#except AttributeError:
#  pass

print "------------ False Position ----------------"
res = false_position(f, -1, 0, 10^(-6), 1)
print "final f v :", (f(res)).n()
print "--------------------------------------------"
res = false_position(f, 0, 1, 10^(-6), 1)
print "final f v :", (f(res)).n()

print "------------ Secant Method -----------------"
res = secant_method(f, -1, 0, 10^(-6), 1)
print "final f v :", (f(res)).n()
print "--------------------------------------------"
res = secant_method(f, 0, 1, 10^(-6), 1)
print "final f v :", (f(res)).n()

print "------------ Newton Method -----------------"
res = newton_method(f, ff, -1/2, 10^(-6), 1)
print "final f v :", (f(res)).n()
print "--------------------------------------------"
res = newton_method(f, ff, 1/2, 10^(-6), 1)
print "final f v :", (f(res)).n()

