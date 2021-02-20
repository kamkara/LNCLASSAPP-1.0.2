class LoginController < ApplicationController
  before_action :find_materials
  before_action :find_levels
  before_action :find_citytowns
  
  def student
  end

  def teacher
  end
  def team
    
  end
  private
  
  #enable material
    def find_materials
      @materials = Material.all
    end
  
    #enable level
    def find_levels
      @levels = Level.all
    end

    def find_citytowns
      @citytowns = Citytown.all
    end
end

