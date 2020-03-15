class TeamsController < ApplicationController
  skip_before_action :login_required, only: [:index,:show]
    def index
    @teams = Team.all
  end

  def list
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

def show
  @team = Team.find(params[:id])
end

def edit
  @team = current_user.team.find(params[:id])
end

def update
  team = Team.find(params[:id])
  team.update!(team_params)
  redirect_to teams_url, notice: "タスク「#{team.name}」を更新しました。"
end

def destroy
  team = Team.find(params[:id])
  team.destroy
  redirect_to teams_url, notice: "タスク「#{team.name}」を削除しました。"
end


private


def team_params
  params.require(:team).permit(:name, :discription, :age, :message, :passion, :Performance, :enjoy)
end
def user_params
  params.require(:user).permit(:name, :email, :password, :password_confirmation)
end
end
