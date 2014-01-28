#@import_date = params[:date]
@import_date = "01272014"
     
doc = Nokogiri::XML(File.open("./imports/" + @import_date + "_zillow.xml"))
     
     #respond_to do |format|
      doc.css('object').each do |node|
      children = node.children
        
        auctionID = Property.where(:id => children.css('auctionID').inner_text.to_i)
        
        if children.css('lastSoldDate').inner_text != ''
          lastSold_date = children.css('lastSoldDate').inner_text[6,4] + "-" + children.css('lastSoldDate').inner_text[0,2] + "-" + children.css('lastSoldDate').inner_text[3,2] 
        end
        if children.css('zEstimateDate').inner_text != ''
          zEstimate_date = children.css('zEstimateDate').inner_text[6,4] + "-" + children.css('zEstimateDate').inner_text[0,2] + "-" + children.css('zEstimateDate').inner_text[3,2]
        end
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
          :lastSoldDate => lastSold_date,
          :lastSold => children.css('lastSold').inner_text,
          :zEstimate => children.css('zEstimate').inner_text,
          :zEstimateDate => zEstimate_date,
          :zillowDetails => children.css('zillowDetails').inner_text,
          :property_id => children.css('auctionID').inner_text.to_i
        )
       end
 