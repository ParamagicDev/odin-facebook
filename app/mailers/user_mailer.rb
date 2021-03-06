class UserMailer < Devise::Mailer
  helper :application # gives access to all helpers defined within `application_helper`.
  include Devise::Controllers::UrlHelpers # Optional. eg. `confirmation_url`
  default template_path: 'users/mailer' # to make sure that your mailer uses the devise views

  default from: 'paramagicapp@example.com'

  def welcome_email(user)
    @user = user
    @url  = 'https://paramagic-app.herokuapp.com/login'
    mail(to: @user.email, subject: 'Welcome to ParamagicBook')
  end
end
