class RoundsController < ApplicationController
  before_action :require_user_logged_in

  def create
    @round = current_user.rounds.build(round_params)
    if @round.save
      flash[:success] = 'ラウンド情報を登録しました。'
      redirect_to root_url
    else
      @rounds = current_user.rounds.order('created_at DESC').page(params[:page])
      flash.now[:danger] = 'ラウンド情報の登録に失敗しました。'
      render 'toppages/index'
    end
  end

  def destroy
    @micropost.destroy
    flash[:success] = 'ラウンド情報を削除しました。'
    redirect_back(fallback_location: root_path)
  end

  private

  def round_params
    params.require(:round).permit(:day, :course, :weather, :wind, :green, :tee, :score_first_nine, :score_back_nine, :score_add, :member1, :member2, :member3, :member4)
  end
  
  def correct_user
    @round = current_user.rounds.find_by(id: params[:id])
    unless @round
      redirect_to root_url
    end
  end
end
