class CoursesController < ApplicationController
  #layout "dashboard", only: [:new, :create, :update]
  before_action :authenticate_user!
  before_action :find_materials, only: [:index, :show, :new, :edit, :create, :update]
  before_action :find_levels, only:    [:index, :show, :new, :edit, :create, :level]
  before_action :set_course, only:     [:show, :edit, :update, :destroy]

  # GET /courses
  # GET /courses.json
  def index
    @courses = Course.all
  end

  # GET /courses/1
  # GET /courses/1.json
  def show
   
  end

  # GET /courses/new
  def new
    @course = Course.new
    render layout: "dashboard"
  end

  # GET /courses/1/edit
  def edit
  end

  # POST /courses
  # POST /courses.json
  def create
    @course        = current_user.courses.build(course_params)
    @course.author  = current_user.full_name
    @course.memo    = current_user.memo

    respond_to do |format|
      if @course.save
        format.html { redirect_to @course, notice: 'La léçon est bien créée et publiée.' }
        format.json { render :show, status: :created, location: @course }
        
      else
        format.html { render :new }
        format.json { render json: @course.errors, status: :unprocessable_entity }
        render layout: "dashboard"
      end
    end
  end

  # PATCH/PUT /courses/1
  # PATCH/PUT /courses/1.json
  def update
    respond_to do |format|
      if @course.update(course_params)
        format.html { redirect_to @course, notice: 'Course was successfully updated.' }
        format.json { render :show, status: :ok, location: @course }
        
      else
        format.html { render :edit }
        format.json { render json: @course.errors, status: :unprocessable_entity }
        
      end
    end
  end

  # DELETE /courses/1
  # DELETE /courses/1.json
  def destroy
    @course.destroy
    respond_to do |format|
      format.html { redirect_to courses_url, notice: 'Course was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.friendly.find(params[:id])
    end

    #enable material
    def find_materials
      @materials = Material.all
    end

    #enable level
    def find_levels
      @levels = Level.all
    end

    # Only allow a list of trusted parameters through.
    def course_params
      params.require(:course).permit(:title, :content, :author, :memo, :level_id, :material_id, :user_id, :slug)
    end
end
