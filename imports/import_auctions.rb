require 'nokogiri'

#@import_date = params[:date]
@import_date = "01272014"
doc = Nokogiri::XML(File.open("./imports/" + @import_date + "_output.xml"))
     
auction_date = @import_date[4,4] + "-" + @import_date[0,2] + "-" + @import_date[2,2] 


     #Property.destroy_all
     
     #respond_to do |format|
      doc.css('object').each do |node|
      children = node.children

        Property.create(
          :id => children.css('ID').inner_text,
          :auctionDate => auction_date,
          :auctionStatus => children.css('status').inner_text,
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
       #format.html { redirect_to properties_url, notice: 'Properties imported.' }
       #format.json { head :no_content }
     #end
