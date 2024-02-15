# An implementation detail you don't want your callers to have to care about
# (e.g. an exception raised by one of your dependencies)
class InnerError < StandardError; end

# A top-level error object you expect your callers to rescue
class OuterError < StandardError; end

def implementation_detail
  raise InnerError, "Implementation detail failed"
end

def wrapped
  implementation_detail
rescue InnerError
  # Within a `rescue` block, Ruby makes the `$!` global variable availale, which
  # is used to populate the exception's `cause` field.
  # ⚠️ This only works when $! is available and cannot be set manually
  # https://docs.ruby-lang.org/en/3.3/Exception.html#class-Exception-label-Global+Variables
  raise OuterError, "High-level operation failed"
end

begin
  wrapped
rescue => e
  puts e.full_message
end

# More reading:
# https://www.honeybadger.io/blog/nested-errors-in-ruby-with-exception-cause/
# https://avdi.codes/exception-causes-in-ruby-2-1/
