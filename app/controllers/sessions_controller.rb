class SessionsController < ApplicationController
  skip_before_action :login_required
  def new
  end

  def create
    user = User.find_by(name: session_params[:name])

    if user&.authenticate(session_params[:password])
      session[:user_id] = user.id
      redirect_to teams_url(), notice: 'ログインしました'
    else
      @error_message = "メールアドレスまたはパスワードが間違っています"
      @user = params[:name]
      @user = params[:password]
      render :new
    end
  end

  def destroy
    reset_session
    redirect_to root_url(), notice: 'ログアウトしました'
  end
private

def session_params
  params.require(:session).permit(:name, :password)
end
end
