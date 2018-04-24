class UserMailer < ApplicationMailer
default from: "annamarie@rogueminx.com"

  def signup_confirmation(user)
    @user = user
    mail to: user.email, subject: "Thanks for signing up!"
  end
end
