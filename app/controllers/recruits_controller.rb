class RecruitsController < ApplicationController

    def index
      @recruits = Recruit.all
  end

  def new
    @recruit = Recruit.new
end

def show
  @recruit = Recruit.find(params[:id])
end

def create
  @recruit = Recruit.new(recruits_params)

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


def recruits_params
  params.require(:recruit).permit(:title, :body, :photo, :team_id, :Capacity)
end
end
