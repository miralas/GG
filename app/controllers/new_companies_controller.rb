class NewCompaniesController < ApplicationController
  before_action :set_new_company, only: [:show, :edit, :update, :destroy]

  # GET /new_companies
  # GET /new_companies.json
  def index
    @companies = NewCompany.where(user: current_user)
  end

  # GET /new_companies/1
  # GET /new_companies/1.json
  def show
    # @company_news = CompanyNews.where(company_id: @company.id )
    @vacancies = Vacancy.where(new_company_id: @new_company.id)
    # @company_contacts = CompanyContact.where(company_id: @company.id)
    # @company_comments = CompanyComment.where(company_id: @company.id)
    # @company_clients = CompanyClient.where(company_id: @company.id)
    # @company_rewiews = CompanyReview.where(company_id: @company.id)
    @company_practices = CompanyPractice.where(new_company_id: @new_company.id)
  end

  # GET /new_companies/new
  def new
    @new_company = NewCompany.new
  end

  # GET /new_companies/1/edit
  def edit
  end

  # POST /new_companies
  # POST /new_companies.json
  def create
    @new_company = NewCompany.new(new_company_params)
    @new_company.user = current_user

    respond_to do |format|
      if @new_company.save
        format.html { redirect_to new_requesit_path, notice: 'Вы успешно добавили компанию!' }
        format.json { render :show, status: :created, location: @new_company }
      else
        format.html { render :new }
        format.json { render json: @new_company.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /new_companies/1
  # PATCH/PUT /new_companies/1.json
  def update
    respond_to do |format|
      if @new_company.update(new_company_params)
        format.html { redirect_to @new_company, notice: 'Вы успешно отредактировали компанию' }
        format.json { render :show, status: :ok, location: @new_company }
      else
        format.html { render :edit }
        format.json { render json: @new_company.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /new_companies/1
  # DELETE /new_companies/1.json
  def destroy
    @new_company.destroy
    respond_to do |format|
      format.html { redirect_to new_companies_url, notice: 'New company was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_new_company
      @new_company = NewCompany.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def new_company_params
      params.require(:new_company).permit(:company_type, :full_title, :short_title, :english_title, :specialization, :logo, :full_adress, :post_adress, :phone, :faks, :email, :website, :director_name, :director_post, :contact_name, :contacy_phone, :contact_email, :user_id)
    end
end
