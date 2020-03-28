class Post < ApplicationRecord
	
	belongs_to :user, optional: true
	
	has_many :likes
	has_many :liked_users, through: :likes, source: :user
	
	has_many :comments, dependent: :destroy
	# コメントが存在するかを見るため
	has_many :commented_users, through: :comments, source: :user

	has_many :clothes

	mount_uploader :image, ImageUploader


	

end
