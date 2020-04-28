class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  	devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

    # ビュー数
    is_impressionable

    has_many :posts, dependent: :destroy
    has_many :likes, dependent: :destroy
    # userがどの投稿をいいねしているのか
  	has_many :liked_posts, through: :likes, source: :post
  	
    has_many :active_relationships, class_name: "Relationship", foreign_key: :following_id
    has_many :followings, through: :active_relationships, source: :follower
    has_many :passive_relationships, class_name: "Relationship", foreign_key: :follower_id
    has_many :followers, through: :passive_relationships, source: :following

    has_many :active_staffs, class_name: "Staff", foreign_key: :registering_id
    has_many :registerings, through: :active_staffs, source: :registered
    has_many :passive_staffs, class_name: "Staff", foreign_key: :registered_id
    has_many :registereds, through: :passive_staffs, source: :registering

  	has_many :comments, dependent: :destroy
  	belongs_to :area, optional: true

    has_one :shop, inverse_of: :user, dependent: :destroy
    #shopのフォームでuserを保存
    accepts_nested_attributes_for :shop, allow_destroy: true
    

    mount_uploader :photo, PhotoUploader



    # follow済み？
    def followed_by?(user)
       passive_relationships.find_by(following_id: user.id).present?
    end

    # staff登録済み？
    def staffed_by?(user)
       passive_staffs.find_by(registering_id: user.id).present?
    end

    #  like済み？
    def already_liked?(post)
      self.likes.exists?(post_id: post.id)
    end

end
