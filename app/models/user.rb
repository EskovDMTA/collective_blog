# frozen_string_literal: true

class User < ApplicationRecord
  has_one_attached :avatar
  has_many :comments, class_name: 'PostComment', dependent: :destroy
  has_many :post_likes, dependent: :destroy
  has_many :posts, foreign_key: 'creator_id', class_name: 'Post', dependent: :destroy, inverse_of: :creator

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validate :avatar_size_validation, if: -> { avatar.attached? }
  validates :profession, length: { maximum: 20 }, allow_blank: true

  has_one_attached :avatar do |attachable|
    attachable.variant :post_avatar, resize_to_limit: [100, 100]
  end

  def avatar_size_validation
    return unless avatar.attached? && avatar.blob.byte_size > 5.megabytes

    errors.add(:avatar, 'should be less than 5MB')
  end

  def post_avatar
    if avatar.attached?
      avatar.variant(:post_avatar)
    else
      'posts/default_avatar.png'
    end
  end
end
