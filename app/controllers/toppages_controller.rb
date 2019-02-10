class ToppagesController < ApplicationController
  def index
    if logged_in?
      @round = current_user.rounds.build  # form_for 用
      @rounds = current_user.feed_rounds.order('created_at DESC').page(params[:page])
    end
  end
end
