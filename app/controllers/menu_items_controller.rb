class MenuItemsController < ApplicationController
  before_action :set_menu_item, only: [:show, :edit, :update, :destroy]

  # GET /menu_items
  # GET /menu_items.json
  def index
    @menu_items = MenuItem.all
  end

  # GET /menu_items/1
  # GET /menu_items/1.json
  def show
  end

  # GET /menu_items/new
  def new
    @menu_item = MenuItem.new
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

  # GET /menu_items/1/edit
  def edit
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

  # POST /menu_items
  # POST /menu_items.json
  def create
    @menu_item = MenuItem.new(menu_item_params)
    respond_to do |format|
      if @menu_item.save
        format.html { redirect_to menu_path, notice: 'Menu item was successfully created.' }
        format.json { render :show, status: :created, location: @menu_item }
      else
        format.html { render :new }
        format.json { render json: @menu_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /menu_items/1
  # PATCH/PUT /menu_items/1.json
  def update
    all_routes = Rails.application.routes.routes
    respond_to do |format|
      if @menu_item.update(menu_item_params)
        format.html { redirect_to menu_path, notice: 'Menu item was successfully updated.' }
        format.json { render :show, status: :ok, location: @menu_item }
      else
        format.html { render :edit }
        format.json { render json: @menu_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /menu_items/1
  # DELETE /menu_items/1.json
  def destroy
    @menu_item.destroy
    respond_to do |format|
      format.html { redirect_to menu_path, notice: 'Menu item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_menu_item
      @menu_item = MenuItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def menu_item_params
      params.require(:menu_item).permit(:title, :link, :publish, :menu_category_id)
    end
end
