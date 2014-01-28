class PropertiesController < ApplicationController
  before_action :set_property, only: [:show, :edit, :update, :destroy]

  # GET /properties
  # GET /properties.json
  def index
    @properties = Property.all
  end

  # GET /properties/1
  # GET /properties/1.json
  def show
    @detail = ZillowDetail.where(:property_id => @property).first
    @parties = Party.where(:property_id => @property)
  end

  # GET /properties/new
  def new
    @property = Property.new
  end

  # GET /properties/1/edit
  def edit
  end

  # POST /properties
  # POST /properties.json
  def create
    @property = Property.new(property_params)

    respond_to do |format|
      if @property.save
        format.html { redirect_to @property, notice: 'Property was successfully created.' }
        format.json { render action: 'show', status: :created, location: @property }
      else
        format.html { render action: 'new' }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /properties/1
  # PATCH/PUT /properties/1.json
  def update
    respond_to do |format|
      if @property.update(property_params)
        format.html { redirect_to @property, notice: 'Property was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /properties/1
  # DELETE /properties/1.json
  def destroy
    @property.destroy
    respond_to do |format|
      format.html { redirect_to properties_url }
      format.json { head :no_content }
    end
  end

   def import
     @import_date = params[:date]
     doc = Nokogiri::XML(File.open("./imports/" + @import_date + "_output.xml"))
     
     auction_date = @import_date[0,2] + "/" + @import_date[2,2] + "/" + @import_date[4,4] + " "
     
     #Property.destroy_all
     
     respond_to do |format|
      doc.css('object').each do |node|
      children = node.children

        Property.create(
          :id => children.css('ID').inner_text,
          :auctionDate => auction_date,
          :auctionStatus => auction_date + children.css('status').inner_text,
          :caseID => children.css('case').inner_text,
          :caseType => children.css('type').inner_text,
          :judgement => children.css('judge').inner_text,
          :assesed => children.css('assesed').inner_text,
          :parcel => children.css('parcel').inner_text,
          :address => children.css('address').inner_text,
          :city => children.css('city').inner_text,
          :state => children.css('state').inner_text,
          :zip => children.css('zip').inner_text,
          :legal => children.css('legal_desc').inner_text,
          :zillow => children.css('zillow').inner_text
        )
       end
       format.html { redirect_to properties_url, notice: 'Properties imported.' }
       format.json { head :no_content }
     end
  end
  
  def clear_db
    Property.destroy_all
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_property
      @property = Property.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def property_params
      params.require(:property).permit(:id, :auctionStatus, :caseID, :caseType, :judgement, :assesed, :parcel, :address, :city, :state, :zip, :legal, :beds, :baths, :area, :lot, :year, :estimate, :rentEstimate, :zillow, :date)
    end
  
end
