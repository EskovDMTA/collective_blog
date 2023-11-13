module CommentsHelper
  def create_nested_comment(comment, post)
    comment.children.new(post: post, user: current_user)
  end
end
