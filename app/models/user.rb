# frozen_string_literal: true

class User < ApplicationRecord
  has_one_attached :avatar
#   do  |attachable|
#     attachable.variant :thumb, resize_to_limit: [100, 100]
# end
  def post_avatar
    if avatar.attached?
      avatar.variant(resize: '100x100').processed
    else
      'posts/default_avatar.png'
    end
  end
  has_many :posts, foreign_key: 'creator_id', class_name: 'Post'
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
