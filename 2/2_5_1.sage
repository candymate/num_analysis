#!/usr/local/bin/sage

def aitken_method(f, v, num):
  nv = f(v)
  nnv = f(f(v))
  vhat = v - ((nv - v)^2)/(nnv - 2*nv + v)
  print "iter :", num
  print "p hat :", vhat
  
  if num > 5:
    return vhat
  else:
    return aitken_method(f, nv, num + 1)

import warnings
warnings.filterwarnings("ignore", category=DeprecationWarning)

x = var('x')

f = cos(x)
res = aitken_method(f, 0.5, 1)
print "--------------------------------"
f = 3^(-x)
res = aitken_method(f, 0.5, 1)

