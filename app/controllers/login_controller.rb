class LoginController < ApplicationController
  before_action :find_materials
  before_action :find_levels
  def student
  end

  def teacher
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
end

