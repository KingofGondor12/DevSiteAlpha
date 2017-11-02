class PagesController < ApplicationController
  def home
    @recent_users = User.all.order(created_at: :desc).limit(5)
  end

  def games
    @game = Game.new
    @list = Game.all.order(created_at: :desc)
  end

  def help
  end
end
