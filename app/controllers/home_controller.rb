class HomeController < ApplicationController
  
  #before_action :authenticate_user!
  before_action :find_levels
  before_action :find_materials

  if :authenticate_user!
    def index
      if current_user.role == "student"
        @courses = Course.where("course.level_id=?", current_user.id).order('created_at desc')
      else current_user.role == "teacher" || current_user.role == "team"
        @courses   = Course.all.order('created_at desc')
      end
      @materials = Material.all.order('created_at desc')
    end
  else
    def def index
    end
  end



private
   def find_levels
      @levels = Level.all
   end

  def find_materials
    @materials = Material.all
  end
end
