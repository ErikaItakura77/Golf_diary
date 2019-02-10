class RoundsController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:destroy, :edit]

  def create
    @round = current_user.rounds.build(round_params)
    if @round.save
      flash[:success] = 'ラウンド情報を登録しました。'
      render :show
    else
      @rounds = current_user.feed_rounds.order('created_at DESC').page(params[:page])
      flash.now[:danger] = 'ラウンド情報の登録に失敗しました。'
      render :new
    end
  end
  
  def new
    @round = Round.new
  end
  
  def index
    # ログインしているユーザー（current_user）が持っているタスクをデーターベースから取ってきている
    # 取ってきたタスクを@tasksという変数に代入している
    @rounds = Round.order(created_at: :desc).page(params[:page]).per(5)
  end
  
  def show
    @round = current_user.feed_rounds.find(params[:id])
  end

  def edit
     @round = Round.find(params[:id])
  end
  
 def update
    @round = Round.find(params[:id])

    if @round.update(round_params)
      flash[:success] = 'ラウンド情報 は正常に更新されました'
      redirect_to @round
    else
      flash.now[:danger] = 'ラウンド情報 は更新されませんでした'
      render :edit
    end
 end

  def destroy
    @round = Round.find(params[:id])
    @round.destroy
    flash[:success] = 'ラウンド情報を削除しました。'
    redirect_to rounds_url
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
