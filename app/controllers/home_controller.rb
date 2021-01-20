class HomeController < ApplicationController
  before_action :find_levels
  before_action :find_materials

  def index
    @courses = Course.all.order('created_at desc')
    @materials = Material.all.order('created_at desc')
  end



private
   def find_levels
      @levels = Level.all
   end

  def find_materials
    @materials = Material.all
  end
end
