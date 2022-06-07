class MatchesController < ApplicationController

  def index
    @user = current_user
    @matches = Match.joins("LEFT JOIN searches ON matches.search_id = searches.id").where("searches.user_id = #{current_user.id}")
  end

  def show
  end

  def destroy
  end
end
