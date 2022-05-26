class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:fname, :lname, :username, :photo])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:fname, :lname, :username, :photo])
  end

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
end
