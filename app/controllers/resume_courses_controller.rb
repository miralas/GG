class ResumeCoursesController < ApplicationController
  before_action :set_resume_course, only: [:show, :edit, :update, :destroy]

  # GET /resume_courses
  # GET /resume_courses.json
  def index
    @resume_courses = ResumeCourse.all
  end

  # GET /resume_courses/1
  # GET /resume_courses/1.json
  def show
  end

  # GET /resume_courses/new
  def new
    @resume_course = ResumeCourse.new
  end

  # GET /resume_courses/1/edit
  def edit
  end

  # POST /resume_courses
  # POST /resume_courses.json
  def create
    @resume_course = ResumeCourse.new(resume_course_params)

    respond_to do |format|
      if @resume_course.save
        format.html { redirect_to @resume_course, notice: 'Resume course was successfully created.' }
        format.json { render :show, status: :created, location: @resume_course }
      else
        format.html { render :new }
        format.json { render json: @resume_course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /resume_courses/1
  # PATCH/PUT /resume_courses/1.json
  def update
    respond_to do |format|
      if @resume_course.update(resume_course_params)
        format.html { redirect_to @resume_course.resume, notice: 'Resume course was successfully updated.' }
        format.json { render :show, status: :ok, location: @resume_course }
      else
        format.html { render :edit }
        format.json { render json: @resume_course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /resume_courses/1
  # DELETE /resume_courses/1.json
  def destroy
    @resume_course.destroy
    respond_to do |format|
      format.html { redirect_to resume_courses_url, notice: 'Resume course was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_resume_course
      @resume_course = ResumeCourse.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def resume_course_params
      params.require(:resume_course).permit(:title, :organization, :specialization, :expire_year, :resume_id)
    end
end
