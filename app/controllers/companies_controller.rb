class CompaniesController < ApplicationController
  before_action :set_company, only: [:show, :edit, :update, :destroy]

  # GET /companies
  # GET /companies.json
  def index
    if !current_user
      @companies = Company.all.limit(5)
    else
      if current_user.role == 'user'
        @companies = Company.all.limit(5)
      else
        @companies = Company.where(user: current_user)
      end
    end
  end

  # GET /companies/1
  # GET /companies/1.json
  def show
    @company = Company.find(params[:id])
    @company_news = CompanyNews.where(company_id: @company.id ).first
    @vacncies = Vacancy.where(company_id: @company.id).first
    @company_cotacts = CompanyContact.where(company_id: @company.id).first
    @company_comments = CompanyComment.where(company_id: @company.id).first
    @company_clients = CompanyClient.where(company_id: @company.id).first
    @company_rewiews = CompanyReview.where(company_id: @company.id).first
    @company_practices = CompanyPractice.where(company_id: @company.id).first
  end

  # GET /companies/new
  def new
    @company = Company.new
  end

  # GET /companies/1/edit
  def edit
  end

  # POST /companies
  # POST /companies.json
  def create
    @company = Company.new(company_params)
    @company.user = current_user

    respond_to do |format|
      if @company.save
        format.html { redirect_to companies_path, notice: 'Компания успешно создана' }
        format.json { render :show, status: :created, location: @company }
      else
        format.html { render :new }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /companies/1
  # PATCH/PUT /companies/1.json
  def update
    respond_to do |format|
      if @company.update(company_params)
        format.html { redirect_to companies_path, notice: 'Общая информация о компании успешно отредактирована' }
        format.json { render :show, status: :ok, location: @company }
      else
        format.html { render :edit }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /companies/1
  # DELETE /companies/1.json
  def destroy
    @company.destroy
    respond_to do |format|
      format.html { redirect_to companies_url, notice: 'Компания успешно удалена' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company
      @company = Company.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def company_params
      params.require(:company).permit(:company_type, :title, :logo, :specialization, :description, :user)
    end
end
