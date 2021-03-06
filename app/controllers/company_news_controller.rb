class CompanyNewsController < ApplicationController
  before_action :set_company_news, only: [:show, :edit, :update, :destroy]

  # GET /company_news
  # GET /company_news.json
  def index
    @company_news = CompanyNews.where(company: params[:company]).first
  end

  # GET /company_news/1
  # GET /company_news/1.json
  def show
  end

  # GET /company_news/new
  def new
    @company_news = CompanyNews.new
  end

  # GET /company_news/1/edit
  def edit
  end

  # POST /company_news
  # POST /company_news.json
  def create
    @company_news = CompanyNews.new(company_news_params)
    @company_news.company = current_user.companies.first
    @company_news.user_id = current_user

    respond_to do |format|
      if @company_news.save
        format.html { redirect_to company_path(@company_news.company), notice: 'Новость добавлена!' }
        format.json { render :show, status: :created, location: @company_news }
      else
        format.html { render :new }
        format.json { render json: @company_news.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /company_news/1
  # PATCH/PUT /company_news/1.json
  def update
    respond_to do |format|
      if @company_news.update(company_news_params)
        format.html { redirect_to company_news_path, notice: 'Новость отредактирована' }
        format.json { render :show, status: :ok, location: @company_news }
      else
        format.html { render :edit }
        format.json { render json: @company_news.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /company_news/1
  # DELETE /company_news/1.json
  def destroy
    @company_news.destroy
    respond_to do |format|
      format.html { redirect_to company_news_index_url, notice: 'Новость была удалена' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company_news
      @company_news = CompanyNews.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def company_news_params
      params.require(:company_news).permit(:title, :body)
    end
end
