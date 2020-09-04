Devise.setup do |config|
  config.mailer_sender = 'please-change-me-at-config-initializers-devise@example.com'
  require 'devise/orm/active_record'
  config.case_insensitive_keys = [:email]
  config.strip_whitespace_keys = [:email]
  config.skip_session_storage = [:http_auth]
  config.stretches = Rails.env.test? ? 1 : 12
  config.reconfirmable = true
  config.expire_all_remember_me_on_sign_out = true
  config.password_length = 6..128
  config.email_regexp = /\A[^@\s]+@[^@\s]+\z/
  config.reset_password_within = 6.hours
  
  config.sign_out_via = :delete

  config.omniauth :openid_connect, {
    name: :openid_connect,
    discovery: true,
    scope: %i[openid],
    response_type: :code,
    issuer: "https://auth.sqroot.dev:443",
    client_options: {
      identifier: "WmtMVjPph_JiY5SQjCbYeWllBs1HklEhVfJfbYmly_c",
      secret: "BOxDcQwfwGA6IX-Ljing_zRYDgj1i6XAi2HmG0MVwMk",
      redirect_uri: "https://70892a6634f3.ngrok.io/users/auth/openid_connect/callback",
    }
  }
  
  ActiveSupport.on_load(:devise_failure_app) do
    include Turbolinks::Controller
  end
end
