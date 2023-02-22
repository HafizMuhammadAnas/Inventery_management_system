class User < ApplicationRecord

  # after_create :mail
  require 'csv'

    has_attached_file :user_image, styles: { medium: "300x300>", thumb: "100x100>" }
    validates_attachment_content_type :user_image, content_type: /\Aimage\/.*\z/

  has_many :orders
  # mount_uploader :image, ImageUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable

  def self.import(file)
    records = CSV.foreach(file, headers: true) do |row|
      user = User.new(row.to_hash)
      user.save
    end
  end
  # def mail
  #   # UsersMailer.send_greetings_notification(self)
  #   UsersMailer.send_greetings_notification(self).deliver_now

  # end
  def grab_image(url)
    img = open(url)
    self.user_image.attachment(io: img, filename: 'pic.png')
  end
end
