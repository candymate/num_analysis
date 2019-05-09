#!/usr/local/bin/sage

# find all roots in an interval given as [a, b]
# non-recursive
def find_all_roots(f, a, b, tol):
  roots = []
  istack = [(a,b)]
  while istack:
    start, end = istack[-1]
    istack = istack[:-1]
    try:
      root = find_root(f, start, end)
    except RuntimeError:
      continue
    if root in roots:
      continue
    if abs(f(root)) < tol: # end condition
      roots.append(root)
    istack.append((start, root-tol)) # add left-side interval
    istack.append((root+tol, end)) # add right-side interval
  return roots

# f, f'''', f'''''
f = sqrt(1 + (cos(x))^2)
g = f.diff().diff().diff().diff()
h = f.diff().diff().diff().diff().diff()

# find all roots
all_roots = find_all_roots(h, 0, 48, 0.1^8)
print all_roots

# find min max from all roots + 0, 48
min = 0.0
max = 0.0
for i in all_roots+[48.0]:
  if i < g(min):
    min = i
  if i > g(max):
    max = i
print min, max
print g(min).n(), g(max).n()

# defualt values setup
n = 562 # calculated from result of above
a = 0
b = 48
h = (b - a) / n

# composite simpson's rule
# just sum of simpson's rule
res = 0.0
for i in xrange(0, n, 2):
  res += (h / 3) * (f(a + i * h) + 4 * f(a + (i + 1) * h) + f(a + (i + 2) * h))
print res.n() # result
print numerical_integral(f, 0, 48) # exact value

