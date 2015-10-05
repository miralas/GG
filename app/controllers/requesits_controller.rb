class RequesitsController < ApplicationController
  before_action :set_requesit, only: [:show, :edit, :update, :destroy]

  # GET /requesits
  # GET /requesits.json
  def index
    @requesits = Requesit.all
  end

  # GET /requesits/1
  # GET /requesits/1.json
  def show
  end

  # GET /requesits/new
  def new
    @requesit = Requesit.new
  end

  # GET /requesits/1/edit
  def edit
  end

  # POST /requesits
  # POST /requesits.json
  def create
    @requesit = Requesit.new(requesit_params)
    if current_user.role == 'client'
      @requesit.new_company = current_user.new_companies.first
    end

    respond_to do |format|
      if @requesit.save
        format.html { redirect_to new_bank_requesit_path, notice: 'Requesit was successfully created.' }
        format.json { render :show, status: :created, location: @requesit }
      else
        format.html { render :new }
        format.json { render json: @requesit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /requesits/1
  # PATCH/PUT /requesits/1.json
  def update
    respond_to do |format|
      if @requesit.update(requesit_params)
        format.html { redirect_to @requesit, notice: 'Requesit was successfully updated.' }
        format.json { render :show, status: :ok, location: @requesit }
      else
        format.html { render :edit }
        format.json { render json: @requesit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /requesits/1
  # DELETE /requesits/1.json
  def destroy
    @requesit.destroy
    respond_to do |format|
      format.html { redirect_to requesits_url, notice: 'Requesit was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_requesit
      @requesit = Requesit.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def requesit_params
      params.require(:requesit).permit(:inn, :kpp, :ogrn, :oktmo, :okpo, :okato, :okogu, :okfs, :okopf, :okved1, :okved2, :okved3s, :new_company_id)
    end
end
