# raise/rescue/ensure
#
# The primary ways you interact with exceptions

$the_number_42 = 42

def basic_example
  $the_number_42 += 1
  raise # RuntimeError by default, message optional
rescue => exception # StandardError by default
  puts "Rescued a default exception:"
  puts exception.full_message
ensure
  $the_number_42 = 42
end

basic_example
puts "This should have been reset to 42:"
puts $the_number_42
