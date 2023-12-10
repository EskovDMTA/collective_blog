# frozen_string_literal: true

class Post < ApplicationRecord
  has_many :comments, class_name: 'PostComment', dependent: :destroy
  has_many :likes, class_name: 'PostLike', dependent: :destroy

  belongs_to :creator, class_name: 'User'
  belongs_to :category

  has_one_attached :image

  validates :title, :body, presence: true
  validate :check_image_size

  def check_image_size
    return unless image.attached?

    return unless image.blob.byte_size > 5.megabytes

    errors.add(:image, 'image should be less than 5MB')
    image.purge
  end

  def formatted_created_at
    created_at.strftime('%d %B %Y')
  end

  def post_image
    if image.attached?
      image
    else
      'posts/post_image.jpg'
    end
  end

  def reading_time
    words_per_minute = 200

    minutes_reading = (body.split.length / words_per_minute) + 1
    minutes_reading.to_s
  end
end
