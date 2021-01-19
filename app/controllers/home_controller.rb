class HomeController < ApplicationController
 
  def index
    @materials = Material.all.order('created_at desc')
  end
end
