class CompanyClientsController < ApplicationController
  before_action :set_company_client, only: [:show, :edit, :update, :destroy]

  # GET /company_clients
  # GET /company_clients.json
  def index
    @company_clients = CompanyClient.where(company: params[:company]).first
  end

  # GET /company_clients/1
  # GET /company_clients/1.json
  def show
  end

  # GET /company_clients/new
  def new
    @company_client = CompanyClient.new
  end

  # GET /company_clients/1/edit
  def edit
  end

  # POST /company_clients
  # POST /company_clients.json
  def create
    @company_client = CompanyClient.new(company_client_params)
    @company_client.company = current_user.companies.first

    respond_to do |format|
      if @company_client.save
        format.html { redirect_to company_path(@company_client.company), notice: 'Клиент успешно добавлен' }
        format.json { render :show, status: :created, location: @company_client }
      else
        format.html { render :new }
        format.json { render json: @company_client.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /company_clients/1
  # PATCH/PUT /company_clients/1.json
  def update
    respond_to do |format|
      if @company_client.update(company_client_params)
        format.html { redirect_to company_clients_path, notice: 'Клиент успешно отредактирован' }
        format.json { render :show, status: :ok, location: @company_client }
      else
        format.html { render :edit }
        format.json { render json: @company_client.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /company_clients/1
  # DELETE /company_clients/1.json
  def destroy
    @company_client.destroy
    respond_to do |format|
      format.html { redirect_to company_clients_url, notice: 'Клиент был успешно удален' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company_client
      @company_client = CompanyClient.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def company_client_params
      params.require(:company_client).permit(:title, :website, :description)
    end
end
