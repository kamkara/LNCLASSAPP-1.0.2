class ExercicesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_exercice, only: [:show, :edit, :update, :destroy]
  before_action :set_course


  # GET /exercices
  def index
    @exercices = Exercice.all
  end

  # GET /exercices/1
  def show
  end

  # GET /exercices/new
  def new
    @exercice = Exercice.new
  end

  # GET /exercices/1/edit
  def edit
  end

  # POST /exercices
  def create
    @exercice = @course.exercices.build(exercice_params)

    if @exercice.save 
      redirect_to course_exercice_path(@course, @exercice), notice: 'Exercice was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /exercices/1
  def update
    if @exercice.update(exercice_params)
      redirect_to @exercice, notice: 'Exercice was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /exercices/1
  def destroy
    @exercice.destroy
    redirect_to exercices_url, notice: 'Exercice was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_exercice
      @exercice = Exercice.friendly.find(params[:id])
    end
    def set_course
      @course = courses.friendly.find(params[:course_id])
    end

    # Only allow a trusted parameter "white list" through.
    def exercice_params
      params.require(:exercice).permit(:title, :content, :annonce1, :champ1, :champ2, :champ3, :annonce2, :champ4, :champ5, :champ6, :annonce3, :champ7, :champ8, :champ9, :slug, :user_id, :course_id)
    end
end
