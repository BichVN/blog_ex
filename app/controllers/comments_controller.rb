class CommentsController < ApplicationController
  def create
    @entry = Entry.find params[:entry_id]
    @comment = @entry.comments.build comment_params
    if @comment.save
      flash[:success] = "comment created!"
      redirect_to root_url
    else
      redirect_to root_url
    end
  end

  private 
  def comment_params
  	params.require(:comment).permit :content, :entry_id, :user_id
  end
end

