class UsersController < ApplicationController
  skip_before_action :login_required
  def index
    @users = User.all
    @teams = Team.all
  end

  def show
    @user = User.find(params[:id])
  end


  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def profile_show
    @teams = Team.all
    @profile = User.find(session[:user_id])
    @teams = @profile.teams
  end

  def profile_edit
    @profile = User.find(session[:user_id])

  end

  def create
    @user = User.new(user_params)

    if @user.save
      IdentificationMailer.send_confirm_to_user(@user).deliver
      redirect_to user_url(@user), notice: "ユーザー「#{@user.name}」を作成しました。"
    else
      render :_form
    end
  end


  def update
    @profile = User.find(params[:id])

    if @profile.update(profile_params)
      redirect_to '/users/profile_show', notice: "ユーザーを更新しました。"
    else
      render :profile_edit
    end
  end


  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_url(@user), notice: "ユーザー「#{@user.name}」を削除しました。"
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  def profile_params
    params.require(:user).permit(:live, :sex, :Birthday)
  end
end
