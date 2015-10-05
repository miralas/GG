class GraduateBankRequesitsController < ApplicationController
  before_action :set_graduate_bank_requesit, only: [:show, :edit, :update, :destroy]

  # GET /graduate_bank_requesits
  # GET /graduate_bank_requesits.json
  def index
    @graduate_bank_requesits = GraduateBankRequesit.all
  end

  # GET /graduate_bank_requesits/1
  # GET /graduate_bank_requesits/1.json
  def show
  end

  # GET /graduate_bank_requesits/new
  def new
    @graduate_bank_requesit = GraduateBankRequesit.new
  end

  # GET /graduate_bank_requesits/1/edit
  def edit
  end

  # POST /graduate_bank_requesits
  # POST /graduate_bank_requesits.json
  def create
    @graduate_bank_requesit = GraduateBankRequesit.new(graduate_bank_requesit_params)
    @graduate_bank_requesit.graduate = current_user.graduate

    respond_to do |format|
      if @graduate_bank_requesit.save
        format.html { redirect_to new_about_graduate_path, notice: 'Graduate bank requesit was successfully created.' }
        format.json { render :show, status: :created, location: @graduate_bank_requesit }
      else
        format.html { render :new }
        format.json { render json: @graduate_bank_requesit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /graduate_bank_requesits/1
  # PATCH/PUT /graduate_bank_requesits/1.json
  def update
    respond_to do |format|
      if @graduate_bank_requesit.update(graduate_bank_requesit_params)
        format.html { redirect_to @graduate_bank_requesit, notice: 'Graduate bank requesit was successfully updated.' }
        format.json { render :show, status: :ok, location: @graduate_bank_requesit }
      else
        format.html { render :edit }
        format.json { render json: @graduate_bank_requesit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /graduate_bank_requesits/1
  # DELETE /graduate_bank_requesits/1.json
  def destroy
    @graduate_bank_requesit.destroy
    respond_to do |format|
      format.html { redirect_to graduate_bank_requesits_url, notice: 'Graduate bank requesit was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_graduate_bank_requesit
      @graduate_bank_requesit = GraduateBankRequesit.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def graduate_bank_requesit_params
      params.require(:graduate_bank_requesit).permit(:bill, :bank, :bank_adress, :bik, :inn, :kpp, :cor_bill, :graduate_id)
    end
end
