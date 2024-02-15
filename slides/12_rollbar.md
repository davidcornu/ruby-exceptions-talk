# Using Rollbar to preserve context

Docs: https://docs.rollbar.com/docs/ruby#usage

```ruby
def weather_condition
  raise "Network error"
rescue => e
  # Report this to Rollbar so we can treat this as a real error 
  Rollbar.error(e)
  # Fail gracefully instead of returning a 500 
  "Unavailable"
end
```