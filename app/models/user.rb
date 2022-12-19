class User < ApplicationRecord
  after_create :mail
  require 'csv'

  has_many :orders
	mount_uploader :image, ImageUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  def self.import(file)
    records = CSV.foreach(file, headers: true) do |row|
      user = User.new(row.to_hash)
      user.save
      # if user.save
      #   ApplicationMailer.send_welcome(user).deliver
      # end
    end

  end
  def mail
    # UsersMailer.send_greetings_notification(self)
    UsersMailer.send_greetings_notification(self).deliver_now

  end
end
