class CommentsController < ApplicationController

  def new
    @comment = Comment.new
  end

  def create

    @comment = current_user.comments.create(comments_params)
    @comment.commentable_id = session[:id]
    @comment.commentable_type ="FilmSession"

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

