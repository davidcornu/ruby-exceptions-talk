# rescue allows you to handle any subclass

class ShouldPageCareBear < StandardError; end

class BadMath < ShouldPageCareBear; end

begin
  raise ShouldPageCareBear
rescue ShouldPageCareBear => exception
  puts "Rescued a ShouldPageCareBear"
  puts exception.full_message
end

begin
  raise BadMath # <- Subclass
rescue ShouldPageCareBear => exception
  puts "Rescued a ShouldPageCareBear"
  puts exception.full_message
  puts exception.class.ancestors.inspect
end
