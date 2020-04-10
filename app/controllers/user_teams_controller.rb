class UserTeamsController < ApplicationController
def create
  @teams = Team.find(params[:team_id])
  @user_team = @teams.user_teams.build(user_id: current_user.id, status: 1)
  if @user_team.save
    flash[:notice] = @teams.name + 'に応募申請成功しました'
    redirect_back(fallback_location: root_path)
end
end

def member
  @team = Team.all
  @user_teams = UserTeam.all
  @team_id = Team.find_by(id: params[:id])
  @user_team = @team_id.user_teams.where(status: 2)
end

def recruit_member
  @team = Team.all
  @user_teams = UserTeam.all
  @team_id = Team.find_by(id: params[:id])
  @user_team = @team_id.user_teams
end

def recruit_member_update
  @user_team = UserTeam.find(params[:team_id])

if @user_team.update(status: 3)
    redirect_to management_show_team_path(), notice: "応募者を拒否しました"
end
end

def update
  @user_team = UserTeam.find(params[:team_id])

if @user_team.update(status: 2)
    redirect_to  management_show_team_path(), notice: "応募者を承認しました"
end
end

private

def team_params
  params.require(:team).permit(:id, :name, :discription, :age, :message,:member, :passion, :Performance,:photo, :enjoy,:photo,:photo_cache,:remove_photo)
end
def user_params
  params.require(:user).permit(:name, :email, :password, :password_confirmation)
end
def profile_params
  params.require(:user).permit(:live, :sex, :Birthday)
end
end
