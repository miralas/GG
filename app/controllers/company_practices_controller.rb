class CompanyPracticesController < ApplicationController
  before_action :set_company_practice, only: [:show, :edit, :update, :destroy]

  # GET /company_practices
  # GET /company_practices.json
  def index
    @company_practices = CompanyPractice.all
  end

  # GET /company_practices/1
  # GET /company_practices/1.json
  def show
  end

  # GET /company_practices/new
  def new
    @company_practice = CompanyPractice.new
  end

  # GET /company_practices/1/edit
  def edit
  end

  # POST /company_practices
  # POST /company_practices.json
  def create
    @company_practice = CompanyPractice.new(company_practice_params)
    @company_practice.company = current_user.companies.first

    respond_to do |format|
      if @company_practice.save
        format.html { redirect_to @company_practice, notice: 'Company practice was successfully created.' }
        format.json { render :show, status: :created, location: @company_practice }
      else
        format.html { render :new }
        format.json { render json: @company_practice.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /company_practices/1
  # PATCH/PUT /company_practices/1.json
  def update
    respond_to do |format|
      if @company_practice.update(company_practice_params)
        format.html { redirect_to @company_practice, notice: 'Company practice was successfully updated.' }
        format.json { render :show, status: :ok, location: @company_practice }
      else
        format.html { render :edit }
        format.json { render json: @company_practice.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /company_practices/1
  # DELETE /company_practices/1.json
  def destroy
    @company_practice.destroy
    respond_to do |format|
      format.html { redirect_to company_practices_url, notice: 'Company practice was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company_practice
      @company_practice = CompanyPractice.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def company_practice_params
      params.require(:company_practice).permit(:payment, :long, :post, :description)
    end
end
