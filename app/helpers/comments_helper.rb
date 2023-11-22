# frozen_string_literal: true

module CommentsHelper
  def create_nested_comment(comment, post)
    comment.children.new(post:, user: current_user)
  end
end
