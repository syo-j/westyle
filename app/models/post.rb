class Post < ApplicationRecord
	
	belongs_to :user, optional: true
	
	has_many :likes, dependent: :destroy
	# 投稿が誰にいいねされているのか
	has_many :liked_users, through: :likes, source: :user
	
	has_many :comments, dependent: :destroy
	# コメントが存在するかを見るため
	has_many :commented_users, through: :comments, source: :user

	has_many :clothes, inverse_of: :post, dependent: :destroy
	#postのフォームでclotheを保存
	accepts_nested_attributes_for :clothes, allow_destroy: true

	mount_uploader :image, ImageUploader


	

end
