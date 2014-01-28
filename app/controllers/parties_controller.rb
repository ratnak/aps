class PartiesController < ApplicationController
  before_action :set_party, only: [:show, :edit, :update, :destroy]

  # GET /parties
  # GET /parties.json
  def index
    @parties = Party.all
  end

  # GET /parties/1
  # GET /parties/1.json
  def show
  end

  # GET /parties/new
  def new
    @party = Party.new
  end

  # GET /parties/1/edit
  def edit
  end

  # POST /parties
  # POST /parties.json
  def create
    @party = Party.new(party_params)

    respond_to do |format|
      if @party.save
        format.html { redirect_to @party, notice: 'Party was successfully created.' }
        format.json { render action: 'show', status: :created, location: @party }
      else
        format.html { render action: 'new' }
        format.json { render json: @party.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /parties/1
  # PATCH/PUT /parties/1.json
  def update
    respond_to do |format|
      if @party.update(party_params)
        format.html { redirect_to @party, notice: 'Party was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @party.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /parties/1
  # DELETE /parties/1.json
  def destroy
    @party.destroy
    respond_to do |format|
      format.html { redirect_to parties_url }
      format.json { head :no_content }
    end
  end

  def import
     @import_date = params[:date]
     doc = Nokogiri::XML(File.open("./imports/" + @import_date + "_output.xml"))
     
     respond_to do |format|
      doc.css('object').each do |node|
      children = node.children
        
        auctionID = Property.where(:id => children.css('ID').inner_text)
        
        children.css('parties').each do |partyNode|
        partyChildren = partyNode.children  
        Party.create(
          :partyType => partyChildren.css('partyType').inner_text,
          :partyName => partyChildren.css('partyName').inner_text,
          :property_id => children.css('auctionID').inner_text.to_i
        )
        end
       end
        format.html { redirect_to properties_url, notice: 'Case Parties Imported.' }
        format.json { head :no_content }
     end
  end
  
  def clear_db
    Party.destroy_all
  end
  
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_party
      @party = Party.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def party_params
      params.require(:party).permit(:property_id, :partyType, :partyName, :date)
    end
end
