class ZillowDetailsController < ApplicationController
  before_action :set_zillow_detail, only: [:show, :edit, :update, :destroy]

  # GET /zillow_details
  # GET /zillow_details.json
  def index
    @zillow_details = ZillowDetail.all
  end

  # GET /zillow_details/1
  # GET /zillow_details/1.json
  def show
  end

  # GET /zillow_details/new
  def new
    @zillow_detail = ZillowDetail.new
  end

  # GET /zillow_details/1/edit
  def edit
  end

  # POST /zillow_details
  # POST /zillow_details.json
  def create
    @zillow_detail = ZillowDetail.new(zillow_detail_params)

    respond_to do |format|
      if @zillow_detail.save
        format.html { redirect_to @zillow_detail, notice: 'Zillow detail was successfully created.' }
        format.json { render action: 'show', status: :created, location: @zillow_detail }
      else
        format.html { render action: 'new' }
        format.json { render json: @zillow_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /zillow_details/1
  # PATCH/PUT /zillow_details/1.json
  def update
    respond_to do |format|
      if @zillow_detail.update(zillow_detail_params)
        format.html { redirect_to @zillow_detail, notice: 'Zillow detail was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @zillow_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /zillow_details/1
  # DELETE /zillow_details/1.json
  def destroy
    @zillow_detail.destroy
    respond_to do |format|
      format.html { redirect_to zillow_details_url }
      format.json { head :no_content }
    end
  end

  def import
     @import_date = params[:date]
     doc = Nokogiri::XML(File.open("./imports/" + @import_date + "_zillow.xml"))
     
     respond_to do |format|
      doc.css('object').each do |node|
      children = node.children
        
        auctionID = Property.where(:id => children.css('auctionID').inner_text.to_i)
        
        ZillowDetail.create(
          :zpid => children.css('zpid').inner_text,
          :useCode => children.css('useCode').inner_text,
          :latitude => children.css('latitude').inner_text,
          :longitude => children.css('longitude').inner_text,
          :year => children.css('year').inner_text,
          :lot => children.css('lot').inner_text,
          :area => children.css('area').inner_text,
          :baths => children.css('baths').inner_text,
          :beds => children.css('beds').inner_text,
          :lastSoldDate => children.css('lastSoldDate').inner_text,
          :lastSold => children.css('lastSold').inner_text,
          :zEstimate => children.css('zEstimate').inner_text,
          :zEstimateDate => children.css('zEstimateDate').inner_text,
          :zillowDetails => children.css('zillowDetails').inner_text,
          :property_id => children.css('auctionID').inner_text.to_i
        )
       end
       format.html { redirect_to properties_url, notice: 'Zillow Details imported.' }
       format.json { head :no_content }
     end
  end
  
  def clear_db
    ZillowDetail.destroy_all
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_zillow_detail
      @zillow_detail = ZillowDetail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def zillow_detail_params
      params.require(:zillow_detail).permit(:property_id, :zpid, :useCode, :latitude, :longitude, :year, :lot, :area, :baths, :beds, :lastSoldDate, :lastSold, :zEstimate, :zEstimateDate, :zRentEstimate, :zRentEstimateDate, :zillowDetails, :date)
    end
end
