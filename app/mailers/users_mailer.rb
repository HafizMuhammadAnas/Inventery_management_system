class UsersMailer < ApplicationMailer
  def send_greetings_notification(user)
    @user = user

    mail to: "hafizanas3838@gmail.com",
    subject: "Book Borrowed"

  end
end
