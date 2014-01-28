require 'nokogiri'

#@import_date = params[:date]
@import_date = "01272014"

doc = Nokogiri::XML(File.open("./imports/" + @import_date + "_output.xml"))
     
doc.css('object').each do |node|
  children = node.children
        
  auctionID = Property.where(:id => children.css('ID').inner_text.to_i)
  
  children.css('parties').each do |partyNode|
    partyChildren = partyNode.children  
    Party.create(
      :partyType => partyChildren.css('partyType').inner_text,
      :partyName => partyChildren.css('partyName').inner_text,
      :property_id => children.css('ID').inner_text.to_i
    )
    end
end