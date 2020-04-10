class RecruitCommentsController < ApplicationController
  def create
    recruit = Recruit.find(params[:recruit_id])
    @recruit_comment = recruit.recruit_comments.build(recruit_comment_params.merge(user_id: current_user.id))
    if @recruit_comment.save!
      flash[:success] = "コメントしました"
      redirect_back(fallback_location: root_path)
    else
      flash[:danger] = "コメントできません"
      redirect_back(fallback_location: root_path)
    end
  end

private

def recruit_comment_params
   params.require(:recruit_comment).permit(:body)
 end
end
