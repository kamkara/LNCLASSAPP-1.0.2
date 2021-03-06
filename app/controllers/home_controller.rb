class HomeController < ApplicationController
  
  #before_action :authenticate_user!

  #before_action :authenticate_user!, unless: :current_user_connected?
  before_action :find_levels
  before_action :find_materials


  #def current_user_connected?
  #  def index
  #    if current_user.role == "student"
  #      @courses = Course.where("course.level_id =? ", current_user.level_id).order("created_at desc")
  #      @materials = Material.all.order("created_at desc")
  #    elsif current_user.role == "teacher" || current_user.role == "team"
  #      @courses   = Course.all.order('created_at desc')
  #      @materials = Material.all.order('created_at desc')
  #    end
  #  end
  #end
  
  
  def index
    @materials = Material.all.order('created_at desc')
    @courses   = Course.all.order('created_at desc')
  end


private
  def find_levels
     @levels = Level.all
  end

  def find_materials
    @materials = Material.all
  end
end
