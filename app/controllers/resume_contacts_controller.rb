class ResumeContactsController < ApplicationController
  before_action :set_resume_contact, only: [:show, :edit, :update, :destroy]

  # GET /resume_contacts
  # GET /resume_contacts.json
  def index
    @resume_contacts = ResumeContact.where(resume: params[:resume]).first
  end

  # GET /resume_contacts/1
  # GET /resume_contacts/1.json
  def show
  end

  # GET /resume_contacts/new
  def new
    @resume_contact = ResumeContact.new
  end

  # GET /resume_contacts/1/edit
  def edit
  end

  # POST /resume_contacts
  # POST /resume_contacts.json
  def create
    @resume_contact = ResumeContact.new(resume_contact_params)

    respond_to do |format|
      if @resume_contact.save
        format.html { redirect_to @resume_contact, notice: 'Контакты успешно добавлены' }
        format.json { render :show, status: :created, location: @resume_contact }
      else
        format.html { render :new }
        format.json { render json: @resume_contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /resume_contacts/1
  # PATCH/PUT /resume_contacts/1.json
  def update
    respond_to do |format|
      if @resume_contact.update(resume_contact_params)
        format.html { redirect_to @resume_contact.resume, notice: 'Контакты успешно обновлены' }
        format.json { render :show, status: :ok, location: @resume_contact }
      else
        format.html { render :edit }
        format.json { render json: @resume_contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /resume_contacts/1
  # DELETE /resume_contacts/1.json
  def destroy
    @resume_contact.destroy
    respond_to do |format|
      format.html { redirect_to resume_contacts_url, notice: 'Resume contact was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_resume_contact
      @resume_contact = ResumeContact.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def resume_contact_params
      params.require(:resume_contact).permit(:mobile_phone, :home_phone, :work_phone, :email, :icq, :skype, :vk, :facebook, :linkedin, :resume_id)
    end
end
