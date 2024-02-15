# you can have multiple rescues

class ErrorOne < StandardError; end
class ErrorTwo < StandardError; end

def multiple_rescues
  yield
rescue ErrorOne => e
  puts "multiple_rescues: Rescued an ErrorOne"
  puts e.full_message
rescue ErrorTwo => e
  puts "multiple_rescues: Rescued a ErrorTwo"
  puts e.full_message
end

multiple_rescues { raise ErrorOne }
multiple_rescues { raise ErrorTwo }

def combined
  yield
rescue ErrorOne, ErrorTwo => e
  puts "combined: Rescued either ErrorOne or ErrorTwo"
  puts e.full_message
end

combined { raise ErrorOne }

EXCEPTIONS = [ErrorOne, ErrorTwo]
def splatted
  yield
rescue *EXCEPTIONS => e
  puts "splatted: Rescued either ErrorOne or ErrorTwo"
  puts e.full_message
end

splatted { raise ErrorTwo }
