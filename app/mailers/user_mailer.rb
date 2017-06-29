class UserMailer < ApplicationMailer
  def send_support_email(user, message)
    @user = user
    @message = message
    mail(
      to: 'Central de Suporte <suporte@barramais.com.br>',
      reply_to: "#{@user.first_name} #{@user.last_name} <#{@user.email}>",
      subject: "Requisição de Suporte enviada por #{@user.first_name} #{@user.last_name}"
    )
  end
end
