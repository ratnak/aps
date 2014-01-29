class Favorite < ActiveRecord::Base
  belongs_to :property
  belongs_to :user


  def self.save_favs_for_checked_prop(current_user,prop_list)
  	prop_list.each do |prop|
  		fav = self.create(:property_id => prop ,:user_id => current_user.id )
  		fav.save
  	end 
  end

end
