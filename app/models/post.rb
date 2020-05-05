class Post < ApplicationRecord
	# ビュー数
	is_impressionable

	belongs_to :user, optional: true
	
	has_many :likes, dependent: :destroy
	# 投稿が誰にいいねされているのか
	has_many :liked_users, through: :likes, source: :user
	
	has_many :comments, dependent: :destroy
	# コメントが存在するかを見るため
	has_many :commented_users, through: :comments, source: :user

	has_many :clothes, dependent: :destroy

	# どのpostにどのblandなどのclothe情報
	has_many :blanded_posts, through: :clothes, source: :bland
	has_many :categoryed_posts, through: :clothes, source: :category
	has_many :colored_posts, through: :clothes, source: :color
	has_many :sized_posts, through: :clothes, source: :size


	mount_uploader :image, ImageUploader
	mount_uploader :video, VideoUploader

	

end
