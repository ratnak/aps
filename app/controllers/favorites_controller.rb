class FavoritesController < ApplicationController
  before_action :set_favorite, only: [:show, :edit, :update, :destroy]
  skip_before_filter :verify_authenticity_token

  # GET /favorites
  # GET /favorites.json
  def index
    @favorites = Favorite.all
  end

  # GET /favorites/1
  # GET /favorites/1.json
  def show
  end

  # GET /favorites/new
  def new
    binding.pry
    @favorite = Favorite.new
  end

  # GET /favorites/1/edit
  def edit
  end

  # POST /favorites
  # POST /favorites.json
  def create
    #binding.pry
    #@favorite = Favorite.new(favorite_params)
    
    # respond_to do |format|
    #   if @favorite.save
    #     format.html { redirect_to @favorite, notice: 'Favorite was successfully created.' }
    #     format.json { render action: 'show', status: :created, location: @favorite }
    #   else
    #     format.html { render action: 'new' }
    #     format.json { render json: @favorite.errors, status: :unprocessable_entity }
    #   end
    # end

    prop_list = params[:favorite][:prop_list] if params[:favorite] && params[:favorite].has_key?('prop_list')
    respond_to do |format| 
      unless prop_list.blank?
        Favorite.save_favs_for_checked_prop(current_user,prop_list)
        format.js {}
      else
        format.js {render json: "failed", status: :unprocessable_entity }
      end 
    end
  end   

  # PATCH/PUT /favorites/1
  # PATCH/PUT /favorites/1.json
  def update
    respond_to do |format|
      if @favorite.update(favorite_params)
        format.html { redirect_to @favorite, notice: 'Favorite was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @favorite.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /favorites/1
  # DELETE /favorites/1.json
  def destroy
    @favorite.destroy
    respond_to do |format|
      format.html { redirect_to favorites_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_favorite
      @favorite = Favorite.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def favorite_params
      params.require(:favorite).permit(:property_id, :user_id, :notes ,:prop_list)
    end
end
