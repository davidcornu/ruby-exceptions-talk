# throw/catch
#
# - If you're coming from other languages, this feature may surprise you
# - In Ruby, throw/catch is a control flow mechanism
# - In general, it should be used sparingly
#
# More details here -> https://avdi.codes/throw-catch-raise-rescue-im-so-confused/

caught = catch(:done) do
  1.upto(10) do |num|
    if num == 9
      throw(:done, num) # takes an optional plain value
    end
  end
end

puts caught.inspect

error = begin
  catch(:done) do
    throw(:something_else)
  end
rescue => e # UncaughtThrowError
  e
end

puts error.full_message
