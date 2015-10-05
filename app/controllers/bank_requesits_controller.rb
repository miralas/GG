class BankRequesitsController < ApplicationController
  before_action :set_bank_requesit, only: [:show, :edit, :update, :destroy]

  # GET /bank_requesits
  # GET /bank_requesits.json
  def index
    @bank_requesits = BankRequesit.all
  end

  # GET /bank_requesits/1
  # GET /bank_requesits/1.json
  def show
  end

  # GET /bank_requesits/new
  def new
    @bank_requesit = BankRequesit.new
  end

  # GET /bank_requesits/1/edit
  def edit
  end

  # POST /bank_requesits
  # POST /bank_requesits.json
  def create
    @bank_requesit = BankRequesit.new(bank_requesit_params)
    if current_user.role == 'client'
      @bank_requesit.new_company = current_user.new_companies.first
    elsif current_user.role == 'learning'
      @bank_requesit.institution = current_user.institution
    end

    respond_to do |format|
      if @bank_requesit.save
        format.html { redirect_to new_about_path, notice: 'Bank requesit was successfully created.' }
        format.json { render :show, status: :created, location: @bank_requesit }
      else
        format.html { render :new }
        format.json { render json: @bank_requesit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bank_requesits/1
  # PATCH/PUT /bank_requesits/1.json
  def update
    respond_to do |format|
      if @bank_requesit.update(bank_requesit_params)
        format.html { redirect_to @bank_requesit, notice: 'Bank requesit was successfully updated.' }
        format.json { render :show, status: :ok, location: @bank_requesit }
      else
        format.html { render :edit }
        format.json { render json: @bank_requesit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bank_requesits/1
  # DELETE /bank_requesits/1.json
  def destroy
    @bank_requesit.destroy
    respond_to do |format|
      format.html { redirect_to bank_requesits_url, notice: 'Bank requesit was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bank_requesit
      @bank_requesit = BankRequesit.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bank_requesit_params
      params.require(:bank_requesit).permit(:bill, :bank, :adress_bank, :bik, :inn, :kpp, :cor_bill, :new_company_id, :institution_id)
    end
end
