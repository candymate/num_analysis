#!/usr/bin/python

# problem 7

import random

def f(x):
  return x * x

def monte_carlo(f, N):  
  res = 0.0
  for i in xrange(N):
    res += f(random.random())
  return res / N

for i in xrange(2, 7):
  n = 10**i
  print monte_carlo(f, n)
  
