class ApplicationController < ActionController::Base

  def matching
    @offers = Offer.all
    @search = Search.find(params[:id])
    @matches = @offers.where(category: @search.category, color: @search.color, size: @search.size)
    if @matches.nil?
      @matches.each do |match|
        newmatch = Match.new(search_id: @search, offer_id: match)
        newmatch.save
      end
    else

    end
  end
  # before_action :authenticate_user!
end
