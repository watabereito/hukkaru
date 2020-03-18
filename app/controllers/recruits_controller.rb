class RecruitsController < ApplicationController

  def index
    @teams = Team.all
    @recruits = Recruit.all
  end

  def my_team_index
    @recruits = Recruit.all
    @team_id = Team.find_by(params[:team_id]).id
    @recruit = @team_id.recruits
  end
  def new
    @recruit = Recruit.new
    @team = Team.find(params[:id])
  end

  def show
    @recruit = Recruit.find(params[:id])
  end

  def create
    @team = Team.find_by(id: params[:id])
    @recruit = Recruit.new(recruits_params.merge(team_id: @team))

    if @recruit.save
      redirect_to recruit_path(@recruit), notice: "タスク「#{@recruit.title}」を登録しました。"
    else
      render :new
    end
  end


  def edit
    @recruit = Recruit.find(params[:id])
  end

  private

  def team_params
    params.require(:team).permit(:id, :name, :discription, :age, :message, :passion, :Performance, :enjoy)
  end
  def recruits_params
    params.require(:recruit).permit(:title, :body, :photo, :Capacity)
  end
end
