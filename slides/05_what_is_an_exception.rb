# message
#   A human-readable message
# full_message
#   What Ruby prints by default (class, message, backtrace)
# backtrace
#   Where this error was raised (note - not constructed)
# set_backtrace
#   Populate backtrace manually (useful with Kernel#caller)
# cause
#   We'll get to this in a bit
#
# See https://docs.ruby-lang.org/en/3.3/Exception.html for
# backtrace_locations
# detailed_message
# exception

puts "Exception's instance methods:"
puts Exception.public_instance_methods - Object.methods

e = begin
  raise StandardError, "a helpful message"
rescue => exception
  exception
end

binding.irb
