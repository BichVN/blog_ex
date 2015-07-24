class EntriesController < ApplicationController
  before_action :logged_in?, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy

  def create
    @entry = current_user.entries.build(entry_params)
    if @entry.save
      flash[:success] = "entry created!"
      redirect_to root_url
    else
      render 'static_pages/home'
    end
  end

  def destroy
    @entry.destroy
    flash[:success] = "entry deleted"
    redirect_to request.referrer || root_url
  end

  def show
    entries = Entry.all
  end
  
  private
  def correct_user
      @entry = current_user.entries.find_by(id: params[:id])
      redirect_to root_url if @entry.nil?
  end

  private
    def entry_params
      params.require(:entry).permit(:body)
    end
end