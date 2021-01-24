class HelpsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_help, only: [:show, :edit, :update, :destroy]
  before_action :find_materials
  # GET /helps
  # GET /helps.json
  def index
    @helps = Help.all
  end

  # GET /helps/1
  # GET /helps/1.json
  def show
  end

  # GET /helps/new
  def new
    @help = Help.new
  end

  # GET /helps/1/edit
  def edit
  end

  # POST /helps
  # POST /helps.json
  def create
    @help        = current_user.helps.build(help_params)
    @help.author = current_user.full_name

    respond_to do |format|
      if @help.save
        format.html { redirect_to @help, notice: 'Help was successfully created.' }
        format.json { render :show, status: :created, location: @help }
      else
        format.html { render :new }
        format.json { render json: @help.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /helps/1
  # PATCH/PUT /helps/1.json
  def update
    respond_to do |format|
      if @help.update(help_params)
        format.html { redirect_to @help, notice: 'Help was successfully updated.' }
        format.json { render :show, status: :ok, location: @help }
      else
        format.html { render :edit }
        format.json { render json: @help.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /helps/1
  # DELETE /helps/1.json
  def destroy
    @help.destroy
    respond_to do |format|
      format.html { redirect_to helps_url, notice: 'Help was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_help
      @help = Help.friendly.find(params[:id])
    end

    def find_materials
      @materials = Material.all
    end

    # Only allow a list of trusted parameters through.
    def help_params
      params.require(:help).permit(:title, :content, :author, :material_id, :user_id, :slug)
    end
end
