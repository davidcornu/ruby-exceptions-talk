# What is a backtrace?
# (a.k.a) A stack trace: https://en.wikipedia.org/wiki/Stack_trace
#
# Every time a function calls another function we add a frame (entry) to the
# stack, and remove it when it returns.
# one ↴           [one]
#     two ↴       [one, two]
#         three   [one, two, three]
#     two ↲       [one, two]
#
# In Ruby, you can inspect it at any time with `caller`

def one
  two
end

def two
  three
end

def three
  binding.irb
end

one
