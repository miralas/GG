class MenuCategoriesController < ApplicationController
  before_action :set_menu_category, only: [:show, :edit, :update, :destroy]

  # GET /menu_categories
  # GET /menu_categories.json
  def index
    @menu_categories = MenuCategory.all
  end

  # GET /menu_categories/1
  # GET /menu_categories/1.json
  def show
  end

  # GET /menu_categories/new
  def new
    @menu_category = MenuCategory.new
    all_routes = Rails.application.routes.routes
    @final_routes = []
    all_routes.each do |route|
      route = route.path.spec.to_s.gsub("(.:format)", '')
      route = route.gsub("/:id", '')
      route = route.gsub('/:provider', '')
      route = route.gsub('/:action', '')
      route = route.gsub( '/:company_id', '' )
      route = route.gsub('/:company', '')
      route = route.gsub('/:resume', '')
      route = route.gsub('/*id', '')
      route = route.gsub('/*path', '')
      @final_routes << route if route != '/'
    end
  end

  # GET /menu_categories/1/edit
  def edit
  end

  # POST /menu_categories
  # POST /menu_categories.json
  def create
    @menu_category = MenuCategory.new(menu_category_params)

    respond_to do |format|
      if @menu_category.save
        format.html { redirect_to menu_path, notice: 'Menu category was successfully created.' }
        format.json { render :show, status: :created, location: @menu_category }
      else
        format.html { render :new }
        format.json { render json: @menu_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /menu_categories/1
  # PATCH/PUT /menu_categories/1.json
  def update
    all_routes = Rails.application.routes.routes
    @final_routes = []
    all_routes.each do |route|
      route = route.path.spec.to_s.gsub("(.:format)", '')
      route = route.gsub("/:id", '')
      route = route.gsub('/:provider', '')
      route = route.gsub('/:action', '')
      route = route.gsub( '/:company_id', '' )
      route = route.gsub('/:company', '')
      route = route.gsub('/:resume', '')
      route = route.gsub('/*id', '')
      route = route.gsub('/*path', '')
      @final_routes << route if route != '/'
      @final_routes << route
    end
    respond_to do |format|
      if @menu_category.update(menu_category_params)
        format.html { redirect_to menu_path, notice: 'Menu category was successfully updated.' }
        format.json { render :show, status: :ok, location: @menu_category }
      else
        format.html { render :edit }
        format.json { render json: @menu_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /menu_categories/1
  # DELETE /menu_categories/1.json
  def destroy
    @menu_category.destroy
    respond_to do |format|
      format.html { redirect_to menu_path, notice: 'Menu category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_menu_category
      @menu_category = MenuCategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def menu_category_params
      params.require(:menu_category).permit(:title, :link, :publish, :color)
    end
end
