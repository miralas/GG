class CompanyReviewsController < ApplicationController
  before_action :set_company_review, only: [:show, :edit, :update, :destroy]

  # GET /company_reviews
  # GET /company_reviews.json
  def index
    @company_reviews = CompanyReview.all
  end

  # GET /company_reviews/1
  # GET /company_reviews/1.json
  def show
  end

  # GET /company_reviews/new
  def new
    @company_review = CompanyReview.new
  end

  # GET /company_reviews/1/edit
  def edit
  end

  # POST /company_reviews
  # POST /company_reviews.json
  def create
    @company_review = CompanyReview.new(company_review_params)
    @company_review.company = current_user.companies.first
    @company_review.user = current_user

    respond_to do |format|
      if @company_review.save
        format.html { redirect_to company_reviews_path, notice: 'Отзыв о компании успешно добавлен' }
        format.json { render :show, status: :created, location: @company_review }
      else
        format.html { render :new }
        format.json { render json: @company_review.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /company_reviews/1
  # PATCH/PUT /company_reviews/1.json
  def update
    respond_to do |format|
      if @company_review.update(company_review_params)
        format.html { redirect_to company_reviews_path, notice: 'Отзыв о компании отредактирован' }
        format.json { render :show, status: :ok, location: @company_review }
      else
        format.html { render :edit }
        format.json { render json: @company_review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /company_reviews/1
  # DELETE /company_reviews/1.json
  def destroy
    @company_review.destroy
    respond_to do |format|
      format.html { redirect_to company_reviews_url, notice: 'Отзыв о компании удален' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company_review
      @company_review = CompanyReview.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def company_review_params
      params.require(:company_review).permit(:review, :mark, :user_id)
    end
end
