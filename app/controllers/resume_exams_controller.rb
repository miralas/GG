class ResumeExamsController < ApplicationController
  before_action :set_resume_exam, only: [:show, :edit, :update, :destroy]

  # GET /resume_exams
  # GET /resume_exams.json
  def index
    @resume_exams = ResumeExam.all
  end

  # GET /resume_exams/1
  # GET /resume_exams/1.json
  def show
  end

  # GET /resume_exams/new
  def new
    @resume_exam = ResumeExam.new
  end

  # GET /resume_exams/1/edit
  def edit
  end

  # POST /resume_exams
  # POST /resume_exams.json
  def create
    @resume_exam = ResumeExam.new(resume_exam_params)

    respond_to do |format|
      if @resume_exam.save
        format.html { redirect_to @resume_exam, notice: "Раздел 'Образование' успешно добавлен" }
        format.json { render :show, status: :created, location: @resume_exam }
      else
        format.html { render :new }
        format.json { render json: @resume_exam.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /resume_exams/1
  # PATCH/PUT /resume_exams/1.json
  def update
    respond_to do |format|
      if @resume_exam.update(resume_exam_params)
        format.html { redirect_to @resume_exam.resume, notice: "Раздел 'Образование' успешно отредактирован" }
        format.json { render :show, status: :ok, location: @resume_exam }
      else
        format.html { render :edit }
        format.json { render json: @resume_exam.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /resume_exams/1
  # DELETE /resume_exams/1.json
  def destroy
    @resume_exam.destroy
    respond_to do |format|
      format.html { redirect_to resume_exams_url, notice: 'Resume exam was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_resume_exam
      @resume_exam = ResumeExam.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def resume_exam_params
      params.require(:resume_exam).permit(:title, :organization, :specialization, :expire_year, :resume_id)
    end
end
