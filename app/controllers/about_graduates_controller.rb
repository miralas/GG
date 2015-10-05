class AboutGraduatesController < ApplicationController
  before_action :set_about_graduate, only: [:show, :edit, :update, :destroy]

  # GET /about_graduates
  # GET /about_graduates.json
  def index
    @about_graduates = AboutGraduate.all
  end

  # GET /about_graduates/1
  # GET /about_graduates/1.json
  def show
  end

  # GET /about_graduates/new
  def new
    @about_graduate = AboutGraduate.new
  end

  # GET /about_graduates/1/edit
  def edit
  end

  # POST /about_graduates
  # POST /about_graduates.json
  def create
    @about_graduate = AboutGraduate.new(about_graduate_params)
    @about_graduate.graduate = current_user.graduate

    respond_to do |format|
      if @about_graduate.save
        format.html { redirect_to graduate_path(current_user.graduate), notice: 'About graduate was successfully created.' }
        format.json { render :show, status: :created, location: @about_graduate }
      else
        format.html { render :new }
        format.json { render json: @about_graduate.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /about_graduates/1
  # PATCH/PUT /about_graduates/1.json
  def update
    respond_to do |format|
      if @about_graduate.update(about_graduate_params)
        format.html { redirect_to @about_graduate, notice: 'About graduate was successfully updated.' }
        format.json { render :show, status: :ok, location: @about_graduate }
      else
        format.html { render :edit }
        format.json { render json: @about_graduate.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /about_graduates/1
  # DELETE /about_graduates/1.json
  def destroy
    @about_graduate.destroy
    respond_to do |format|
      format.html { redirect_to about_graduates_url, notice: 'About graduate was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_about_graduate
      @about_graduate = AboutGraduate.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def about_graduate_params
      params.require(:about_graduate).permit(:about, :profession, :achievements, :competence, :recomendations, :photo, :graduate_id)
    end
end
