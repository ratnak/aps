module ApplicationHelper

  def tab_active(name)
  	"active" if controller.controller_name == name
  end

end
