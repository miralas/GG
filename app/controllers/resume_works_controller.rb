class ResumeWorksController < ApplicationController
  before_action :set_resume_work, only: [:show, :edit, :update, :destroy]

  # GET /resume_works
  # GET /resume_works.json
  def index
    @resume_works = ResumeWork.where(resume: params[:resume]).first
  end

  # GET /resume_works/1
  # GET /resume_works/1.json
  def show
    respond_to do |format|
      format.js { render :show, locals: { :'@resume' => @resume_work.resume } }
    end
  end

  # GET /resume_works/new
  def new
    @resume_work = ResumeWork.new
  end

  # GET /resume_works/1/edit
  def edit
  end

  # POST /resume_works
  # POST /resume_works.json
  def create
    @resume_work = ResumeWork.new(resume_work_params)

    respond_to do |format|
      if @resume_work.save
        format.html { redirect_to @resume_work, notice: "Раздел 'Опыт работы' успешно создан" }
        format.json { render :show, status: :created, location: @resume_work }
      else
        format.html { render :new }
        format.json { render json: @resume_work.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /resume_works/1
  # PATCH/PUT /resume_works/1.json
  def update
    respond_to do |format|
      if @resume_work.update(resume_work_params)
        format.html { redirect_to @resume_work.resume, notice: "Раздел 'Опыт работы' успешно отредактирован" }
        format.json { render :show, status: :ok, location: @resume_work }
      else
        format.html { render :edit }
        format.json { render json: @resume_work.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /resume_works/1
  # DELETE /resume_works/1.json
  def destroy
    @resume_work.destroy
    respond_to do |format|
      format.html { redirect_to resume_works_url, notice: 'Resume work was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_resume_work
      @resume_work = ResumeWork.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def resume_work_params
      params.require(:resume_work).permit(:organization, :region, :website, :sphere, :post, :begin_work, :end_work, :functions, :skills, :about, :resume_id)
    end
end
