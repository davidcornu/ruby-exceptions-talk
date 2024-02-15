# `rescue_from`

Docs: https://api.rubyonrails.org/classes/ActiveSupport/Rescuable/ClassMethods.html#method-i-rescue_from

```ruby
class ApplicationController < ActionController::Base
  rescue_from(Unauthorized, with: :unauthorized)

  private

  def unauthorized(_exception)
    redirect_to(root_url, alert: "You are not authorized to perform that action")
  end
end
```

We use this quite a bit: https://github.com/search?q=repo%3Apatch-technology%2Fpatch%20rescue_from&type=code

# `config.action_dispatch.rescue_responses`

Docs: https://guides.rubyonrails.org/configuring.html#config-action-dispatch-rescue-responses

This is typically how gems (including parts of Rails) configure default responses to their exceptions.

Example from `ActiveRecord`: https://github.com/rails/rails/blob/bbdb23dcd643d9ba09112aead7d493a6d8004df5/activerecord/lib/active_record/railtie.rb#L23-L28

```
[5] pry(main)> ActionDispatch::ExceptionWrapper.rescue_responses.group_by(&:last).transform_values { |a| a.map(&:first) }
=> {:not_found=>
  ["ActionController::RoutingError",
   "AbstractController::ActionNotFound",
   "ActiveRecord::RecordNotFound"],
 :method_not_allowed=>
  ["ActionController::MethodNotAllowed", "ActionController::UnknownHttpMethod"],
 :not_implemented=>["ActionController::NotImplemented"],
 :not_acceptable=>
  ["ActionController::UnknownFormat",
   "ActionDispatch::Http::MimeNegotiation::InvalidType",
   "ActionController::MissingExactTemplate"],
 :unprocessable_entity=>
  ["ActionController::InvalidAuthenticityToken",
   "ActionController::InvalidCrossOriginRequest",
   "ActiveRecord::RecordInvalid",
   "ActiveRecord::RecordNotSaved"],
 :bad_request=>
  ["ActionDispatch::Http::Parameters::ParseError",
   "ActionController::BadRequest",
   "ActionController::ParameterMissing",
   "Rack::QueryParser::ParameterTypeError",
   "Rack::QueryParser::InvalidParameterError"],
 :conflict=>["ActiveRecord::StaleObjectError"]}
```
