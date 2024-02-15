def handle
  raise StandardError, "Something went wrong"
rescue => e
  yield(e)
end

handle { |e| puts "Bad", e }

handle { |e| puts "Also bad", e.message }

handle { |e| puts "Good", e.full_message }
