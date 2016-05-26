class CommentsController < ApplicationController

  def new
    # @film_session_id =
    @comment = Comment.new
  end

  def create
    @film_session_id = session[:id]
    @comment = current_user.comments.create(comments_params)
    @comment.commentable_id = session[:id]
    @comment.commentable_type = session[:type]

    if @comment.save
      flash[:success] = "New comment was successufly added"
      redirect_to film_sessions_path
    else
      render 'new'
    end
  end

  private

    def comments_params
      params.require(:comment).permit(:body)
    end

end


