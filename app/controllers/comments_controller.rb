class CommentsController < ApplicationController
  def index
  end

  def edit
  end

  def create
    @link = Link.find_by(id: params[:link_id])
    @comment = @link.comments.new(user: current_user, body: comment_params[:body])

    if @comment.save
      redirect_to @link, notice: 'Comment created'
    else
      redirect_to @link, notice: 'Comment was not saved. Ensure you have entered a comment'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
