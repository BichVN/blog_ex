class StaticPagesController < ApplicationController
  def home
  	if logged_in?
  	 @entry = Entry.new
  	 @entries = current_user.entries.paginate(page: params[:page])
  	 @comment = Comment.new
  	end 
  end
end
