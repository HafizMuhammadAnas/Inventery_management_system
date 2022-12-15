class User < ApplicationRecord
  require 'csv'

  has_many :orders
	mount_uploader :image, ImageUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  def self.import(file)
    records = CSV.foreach(file, headers: true) do |row|
      user = User.new(row.to_hash)
      user.save
      # if user.save
      #   ApplicationMailer.send_welcome(user).deliver
      # end
    end
  end
end
