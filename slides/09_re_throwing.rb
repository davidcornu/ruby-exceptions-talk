def upstream_failure
  raise StandardError, "Something bad happened upstream"
rescue => e
  e
end

def handle
  exception = upstream_failure
  yield(exception)
rescue => e
  puts e.full_message
end

# Bad
# Passing the message means we throw away the backtrace
handle do |e|
  raise e.message
end

# Also bad
# While it's not unreasonable to expect this to do the right thing, what
# actually ends up happening is that `e` gets coerced to a string (via `to_s`)
handle do |e|
  raise StandardError, e
end

# Good
# Re-raising the exact same object preserves the trail
handle do |e|
  raise e
end
