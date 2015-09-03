class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :get_news

  def get_news
    @company_all_news = CompanyNews.limit(10).reverse
  end

  def stored_location_for(resource)
    nil
  end

  def after_sign_in_path_for(resource)
    if current_user.role == 'client'
      companies_path
    else
      resumes_path
    end
  end
end
