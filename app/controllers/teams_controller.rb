class TeamsController < ApplicationController
  skip_before_action :login_required, only: [:index,:show]
  def index
    @teams = Team.all
    @users = User.all
    render layout: false
  end

  def search
    @team = Team.search(params[:search])
    @teams = Team.all
  end


  def new
    @team = Team.new
  end

  def create
    @team = Team.new(team_params.merge(user_id: current_user.id))

    if @team.save
      redirect_to team_url(@team), notice: "タスク「#{@team.name}」を登録しました。"
    else
      render :new
    end
  end

  def management_show
    @teams = Team.all
    @team = Team.find(params[:id])
  end

  def show
    @team = Team.find(params[:id])
    @user_teams = @team.user_teams
    @user_team = @team.user_teams.new
  end

  def edit
    @teams = Team.all
    @team = Team.find(params[:id])
  end

  def update
    @team = Team.find(params[:id])
    @team.update!(team_params)
    redirect_to teams_url, notice: "タスク「#{@team.name}」を更新しました。"
  end
  def destroy
    @team = Team.find(params[:id])
    @team.destroy
    redirect_to teams_url, notice: "タスク「#{@team.name}」を削除しました。"
  end


  private


  def team_params
    params.require(:team).permit(:id, :name, :discription, :age, :message,:member, :passion, :Performance,:photo, :enjoy,:photo,:photo_cache,:remove_photo)
  end


  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
