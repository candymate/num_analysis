#!/usr/local/bin/sage

def iterate_func(f, v, num):
  try:
    f = f._fast_float_(f.variables()[0])
  except AttributeError:
    pass
  print "iter :", num
  print "v :", v
  print "f v :", f(v)
  if num == 4:
    return f(v)
  else:
    return iterate_func(f, f(v), num+1)

x = var('x')
#f = (3 + x - 2*(x^2))^(1/4)
#f = ((x + 3 - (x^4)) / 2) ^ (1/2)
#f = ((x + 3) / ((x^2) + 2)) ^ (1/2)
#f = ((3*(x^4) + 2*(x^2) + 3) / (4*(x^3) + 4*x - 1))
#iterate_func(f, 1, 0)

f = (x^4) + 2*(x^2) - x - 3
print f.roots(x, ring=CC, multiplicities=False)
