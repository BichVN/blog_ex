class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def create
    @user = User.create user_params
    if @user.save
      flash[:success] = "Dang nhap thanh cong"
       redirect_to root_path
    else
      render :new 
    end
  end

  def show
    @user = User.find(params[:id])
    @entries = current_user.entries.paginate(page: params[:page])
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end

  def following
    @title = "Following"
    @user  = User.find(params[:id])
    @users = @user.following.paginate(page: params[:page])
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user  = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end

  private
  def user_params
    # tim nhung thang nao lien quan den user ma thoa man cac dieu kien trong ngoac.
    params.require(:user).permit :name, :email, :password,
                                   :password_confirmation
  end
end
