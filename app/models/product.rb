class Product < ApplicationRecord
	# mount_uploader :image, ImageUploader
	has_attached_file :product_image, styles: { medium: "300x300>", thumb: "100x100>" }
	validates_attachment_content_type :product_image, content_type: /\Aimage\/.*\z/

	validates :name, presence: true, uniqueness: true
	validates :price, presence: true
	validates :status, presence: true
	validates :stock, presence: true

	validates_numericality_of :price
	validates_numericality_of :stock
	has_many :items, dependent: :destroy

	# has_one_attached :image

	def can_destroy
		self.items.empty?
	end
end
