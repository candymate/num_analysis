#!/usr/local/bin/sage

def bisect_method(f, a, b, eps):
    iter = 0
    try:
        f = f._fast_float_(f.variables()[0])
    except AttributeError:
        pass
    intervals = [(a,b)]
    two = float(2); eps = float(eps)
    while True:
        c = (a+b)/two
        fa = f(a); fb = f(b); fc = f(c)
        print "iter :", iter
        print "interval a :", a, fa
        print "interval b :", b, fb
        print "try c :", c, fc
        print "precision :", abs(b - c)
        iter += 1
        if abs(b - c) < eps: return c, intervals
        if fa*fc < 0:
            a, b = a, c
        elif fc*fb < 0:
            a, b = c, b
        else:
            raise ValueError, "f must have a sign change in the interval (%s,%s)"%(a,b)
        intervals.append((a,b))

x = var('x')
f = x^3 + x - 4
bisect_method(f, 1, 4, 10^(-3))
