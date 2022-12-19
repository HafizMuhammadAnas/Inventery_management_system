class UsersMailer < ApplicationMailer
  def send_greetings_notification(user)
    create_reset_password_token(user)
    @user = user

    mail to: user.email,
    subject: "Book Borrowed"

  end
  def create_reset_password_token(user)
    raw, hashed = Devise.token_generator.generate(User, :reset_password_token)
    @token = raw
    user.reset_password_token = hashed
    user.reset_password_sent_at = Time.now.utc
    user.save
  end
end
