# frozen_string_literal: true

class User < ApplicationRecord
  mount_uploader :avatar, AvatarUploader

  has_many :comments, class_name: 'PostComment', dependent: :destroy
  has_many :post_likes, dependent: :destroy
  has_many :posts, foreign_key: 'creator_id', class_name: 'Post', dependent: :destroy, inverse_of: :creator

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :profession, length: { maximum: 20 }, allow_blank: true

  def post_avatar
    avatar.post_avatar.url || ActionController::Base.helpers.asset_path('posts/default_avatar.png')
  end
end
