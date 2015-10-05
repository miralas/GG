class GraduateRequesitsController < ApplicationController
  before_action :set_graduate_requesit, only: [:show, :edit, :update, :destroy]

  # GET /graduate_requesits
  # GET /graduate_requesits.json
  def index
    @graduate_requesits = GraduateRequesit.all
  end

  # GET /graduate_requesits/1
  # GET /graduate_requesits/1.json
  def show
  end

  # GET /graduate_requesits/new
  def new
    @graduate_requesit = GraduateRequesit.new
  end

  # GET /graduate_requesits/1/edit
  def edit
  end

  # POST /graduate_requesits
  # POST /graduate_requesits.json
  def create
    @graduate_requesit = GraduateRequesit.new(graduate_requesit_params)
    @graduate_requesit.graduate = current_user.graduate

    respond_to do |format|
      if @graduate_requesit.save
        format.html { redirect_to new_graduate_bank_requesit_path, notice: 'Graduate requesit was successfully created.' }
        format.json { render :show, status: :created, location: @graduate_requesit }
      else
        format.html { render :new }
        format.json { render json: @graduate_requesit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /graduate_requesits/1
  # PATCH/PUT /graduate_requesits/1.json
  def update
    respond_to do |format|
      if @graduate_requesit.update(graduate_requesit_params)
        format.html { redirect_to @graduate_requesit, notice: 'Graduate requesit was successfully updated.' }
        format.json { render :show, status: :ok, location: @graduate_requesit }
      else
        format.html { render :edit }
        format.json { render json: @graduate_requesit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /graduate_requesits/1
  # DELETE /graduate_requesits/1.json
  def destroy
    @graduate_requesit.destroy
    respond_to do |format|
      format.html { redirect_to graduate_requesits_url, notice: 'Graduate requesit was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_graduate_requesit
      @graduate_requesit = GraduateRequesit.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def graduate_requesit_params
      params.require(:graduate_requesit).permit(:birth_date, :place_birth, :nationality, :sex, :inn, :graduate_id)
    end
end
