class SearchesController < ApplicationController
  def index
    def index
      @searches = Search.all
    end

    # @markers = @searchs.geocoded.map do |search|
    #   {
    #     lat: search.latitude,
    #     lng: search.longitude
    #     # info_window: render_to_string(partial: "info_window", locals: { search: search }),
    #     # image_url: helpers.asset_url("anchor2.png")
    #   }
    # end
  end

  def show
    @search = Search.find(params[:id])

    # @markers = [{
    #   lat: @search.latitude,
    #   lng: @search.longitude
    #   # info_window: render_to_string(partial: "info_window", locals: { search: @search }),
    #   # image_url: helpers.asset_url("anchor2.png")
    # }]
  end

  def new
    @search = Search.new
  end

  def create
    @search = Search.new(search_params)
    if current_user.nil?
      @search.user = User.find(1)
    else
      @search.user = current_user
    end
    if @search.save

      redirect_to searches_path
    else
      raise
    end
  end

  def edit
    @search = Search.find(params[:id])
  end

  def update
    @search = Search.find(params[:id])
    @search.update(search_params)

    redirect_to search_path(@search)
  end

  def destroy
    @search = Search.find(params[:id])
    @search.destroy
    redirect_to searchs_path
  end


  private

  def search_params
    params.require(:search).permit(:title, :location, :price, :size, :color, :condition, :style, :material, :smoke_free, :pet_free, :receipt)
  end

end
