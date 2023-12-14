# frozen_string_literal: true

class Post < ApplicationRecord
  mount_uploader :image, ImageUploader
  has_many :comments, class_name: 'PostComment', dependent: :destroy
  has_many :likes, class_name: 'PostLike', dependent: :destroy

  belongs_to :creator, class_name: 'User'
  belongs_to :category, inverse_of: :posts

  validates :title, presence: true, length: { minimum: 10, maximum: 100 }
  validates :body, presence: true, length: { minimum: 10, maximum: 2000 }

  def post_image
    image.url || ActionController::Base.helpers.asset_path('posts/post_image.jpg')
  end

  def formatted_created_at
    created_at.strftime('%d %B %Y')
  end

  def reading_time
    words_per_minute = 200

    minutes_reading = (body.split.length / words_per_minute) + 1
    minutes_reading.to_s
  end
end
