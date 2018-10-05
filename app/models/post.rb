class Post < ApplicationRecord
	mount_uploader :image, ImageUploader
	extend FriendlyId
  friendly_id :title, use: :slugged
end
