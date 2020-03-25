class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  	devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

    has_many :posts, dependent: :destroy
    has_many :likes, dependent: :destroy
  	has_many :liked_posts, through: :likes, source: :post
  	
    has_many :active_relationships, class_name: "Relationship", foreign_key: :following_id
    has_many :followings, through: :active_relationships, source: :follower

    has_many :passive_relationships, class_name: "Relationship", foreign_key: :follower_id
    has_many :followers, through: :passive_relationships, source: :following

  	has_many :comments, dependent: :destroy
  	belongs_to :area, optional: true
    belongs_to :shop, optional: true

    mount_uploader :photo, PhotoUploader



    # follow済み？
    def followed_by?(user)
       passive_relationships.find_by(following_id: user.id).present?
    end

    #  like済み？
    def already_liked?(post)
      self.likes.exists?(post_id: post.id)
    end

end
