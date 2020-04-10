class RecruitsController < ApplicationController
  skip_before_action :login_required, only: [:index,:show]

  def index
    @teams = Team.all
    @recruits = Recruit.all
  end

  def my_team_index
    @recruits = Recruit.all
    @team_id = Team.find_by(id: params[:id])
    @recruit = @team_id.recruits
  end
  def new
    @teams = Team.all
    @recruit = Recruit.new
  end

  def show
    @recruit = Recruit.find(params[:id])
    @recruit_comments = @recruit.recruit_comments
    @recruit_comment = @recruit.recruit_comments.new
    @user = User.find_by(id: @recruit_comment.user_id)
    @users = User.find(params[:id])
  end

  def my_team_show
    @recruits = Recruit.all
    @recruit = Recruit.find(params[:id])
  end

  def create
    @recruit = Recruit.new(recruits_params)

    if @recruit.save
      redirect_to my_team_show_recruit_path(@recruit), notice: "「#{@recruit.title}」を募集掲示板に登録しました"
    else
      render :new
    end
  end


  def edit
    @recruit = Recruit.find(params[:id])
  end

  def update
    @recruit = Recruit.find(params[:id])

    if @recruit.update(recruits_params)
      redirect_to my_team_show_recruit_url(@recruit), notice: "ユーザーを更新しました。"
    else
      render :recruit_edit
    end
  end


  def destroy
    @recruit = Recruit.find(params[:id])
    @recruit.destroy
    redirect_to users_profile_show_url, notice: "ユーザー「#{@recruit.title}」を削除しました。"
  end


  private

  def team_params
    params.require(:team).permit(:id, :name, :discription, :age, :message, :passion, :Performance, :enjoy)
  end
  def recruits_params
    params.require(:recruit).permit(:title, :body, :photo, :Capacity, :team_id)
  end
end
