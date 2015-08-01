class ResumeRecomendationsController < ApplicationController
  before_action :set_resume_recomendation, only: [:show, :edit, :update, :destroy]

  # GET /resume_recomendations
  # GET /resume_recomendations.json
  def index
    @resume_recomendations = ResumeRecomendation.where(resume: params[:resume]).first
  end

  # GET /resume_recomendations/1
  # GET /resume_recomendations/1.json
  def show
    respond_to do |format|
      format.js { render :show, locals: { :'@resume' => @resume_recomendation.resume } }
    end
  end

  # GET /resume_recomendations/new
  def new
    @resume_recomendation = ResumeRecomendation.new
  end

  # GET /resume_recomendations/1/edit
  def edit
  end

  # POST /resume_recomendations
  # POST /resume_recomendations.json
  def create
    @resume_recomendation = ResumeRecomendation.new(resume_recomendation_params)

    respond_to do |format|
      if @resume_recomendation.save
        format.html { redirect_to @resume_recomendation, notice: 'Рекомендация успешно добавлена' }
        format.json { render :show, status: :created, location: @resume_recomendation }
      else
        format.html { render :new }
        format.json { render json: @resume_recomendation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /resume_recomendations/1
  # PATCH/PUT /resume_recomendations/1.json
  def update
    respond_to do |format|
      if @resume_recomendation.update(resume_recomendation_params)
        format.html { redirect_to @resume_recomendation.resume, notice: 'Рекомендация успешно отредактирована' }
        format.json { render :show, status: :ok, location: @resume_recomendation }
      else
        format.html { render :edit }
        format.json { render json: @resume_recomendation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /resume_recomendations/1
  # DELETE /resume_recomendations/1.json
  def destroy
    @resume_recomendation.destroy
    respond_to do |format|
      format.html { redirect_to resume_recomendations_url, notice: 'Resume recomendation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_resume_recomendation
      @resume_recomendation = ResumeRecomendation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def resume_recomendation_params
      params.require(:resume_recomendation).permit(:name, :post, :organization, :phone, :resume_id)
    end
end
