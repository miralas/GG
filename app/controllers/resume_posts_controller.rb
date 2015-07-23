class ResumePostsController < ApplicationController
  before_action :set_resume_post, only: [:show, :edit, :update, :destroy]

  # GET /resume_posts
  # GET /resume_posts.json
  def index
    @resume_posts = ResumePost.all
  end

  # GET /resume_posts/1
  # GET /resume_posts/1.json
  def show
  end

  # GET /resume_posts/new
  def new
    @resume_post = ResumePost.new
  end

  # GET /resume_posts/1/edit
  def edit
  end

  # POST /resume_posts
  # POST /resume_posts.json
  def create
    @resume_post = ResumePost.new(resume_post_params)

    respond_to do |format|
      if @resume_post.save
        format.html { redirect_to @resume_post, notice: 'Resume post was successfully created.' }
        format.json { render :show, status: :created, location: @resume_post }
      else
        format.html { render :new }
        format.json { render json: @resume_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /resume_posts/1
  # PATCH/PUT /resume_posts/1.json
  def update
    respond_to do |format|
      if @resume_post.update(resume_post_params)
        format.html { redirect_to @resume_post.resume, notice: 'Resume post was successfully updated.' }
        format.json { render :show, status: :ok, location: @resume_post }
      else
        format.html { render :edit }
        format.json { render json: @resume_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /resume_posts/1
  # DELETE /resume_posts/1.json
  def destroy
    @resume_post.destroy
    respond_to do |format|
      format.html { redirect_to resume_posts_url, notice: 'Resume post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_resume_post
      @resume_post = ResumePost.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def resume_post_params
      params.require(:resume_post).permit(:wish_post, :specialization, :salary, :employment, :timetable, :resume)
    end
end
