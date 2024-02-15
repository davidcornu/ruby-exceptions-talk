# freshly-constructed exceptions have no backtrace
one = StandardError.new
puts "one's backtrace is empty"
puts one.backtrace.inspect

# It is populated when they are raised
begin
  raise one
rescue
  # Do nothing
end

puts "one now has a backtrace"
puts one.backtrace.inspect

# Or by setting it manually
def set_backtrace(e)
  e.set_backtrace(caller(0)) # the 0 is needed to get the current location
end
set_backtrace(one)
puts "one has a manually-set backtrace"
puts one.backtrace.inspect





