Rails.application.configure do
  config.action_mailer.smtp_settings = {
    address: 'mail.barramais.com.br',
    port: 25,
    domain: "barramais.com.br",
    enable_starttls_auto: false,
    user_name: ENV['MAILER_USERNAME'],
    password: ENV['MAILER_PASSWORD']
  }
end
