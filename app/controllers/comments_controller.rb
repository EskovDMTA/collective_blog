class CommentsController < ApplicationController
  before_action :authenticate_user!, only: %i[create]

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.post_comments.build(comment_params)
    @comment.user = current_user
    # parent_comment = PostComment.find(params[:parent_id]) if params[:parent_id].present?
    # @comment = parent_comment.children.build(comment_params)
    if @comment.save
      redirect_to post_path(params[:post_id]), notice: 'Комментарий успешно добавлен!'
    else
      redirect_to post_path(params[:post_id]), alert: 'Не удалось добавить комментарий!'
    end
  end

  def show
  end

  private

  def comment_params
    params.require(:post_comment).permit(:content, :parent_id)
  end
end
