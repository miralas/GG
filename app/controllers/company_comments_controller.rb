class CompanyCommentsController < ApplicationController
  before_action :set_company_comment, only: [:show, :edit, :update, :destroy]

  # GET /company_comments
  # GET /company_comments.json
  def index
    @company_comments = CompanyComment.all
  end

  # GET /company_comments/1
  # GET /company_comments/1.json
  def show
  end

  # GET /company_comments/new
  def new
    @company_comment = CompanyComment.new
  end

  # GET /company_comments/1/edit
  def edit
  end

  # POST /company_comments
  # POST /company_comments.json
  def create
    @company_comment = CompanyComment.new(company_comment_params)
    @company_comment.company = current_user.companies.first
    @company_comment.user = current_user

    respond_to do |format|
      if @company_comment.save
        format.html { redirect_to company_comments_path, notice: 'Company comment was successfully created.' }
        format.json { render :show, status: :created, location: @company_comment }
      else
        format.html { render :new }
        format.json { render json: @company_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /company_comments/1
  # PATCH/PUT /company_comments/1.json
  def update
    respond_to do |format|
      if @company_comment.update(company_comment_params)
        format.html { redirect_to company_comments_path, notice: 'Company comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @company_comment }
      else
        format.html { render :edit }
        format.json { render json: @company_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /company_comments/1
  # DELETE /company_comments/1.json
  def destroy
    @company_comment.destroy
    respond_to do |format|
      format.html { redirect_to company_comments_url, notice: 'Company comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company_comment
      @company_comment = CompanyComment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def company_comment_params
      params.require(:company_comment).permit(:comment, :company_id, :user_id)
    end
end
