class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :get_news

  def get_news
    @company_news = CompanyNews.limit(10).reverse
  end

end
