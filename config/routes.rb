Rails.application.routes.draw do

  mount RedactorRails::Engine => '/redactor_rails'
  resources :news
  resources :banners
  get 'calendar', to: 'calendar#index'

  resources :events
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks", registrations: 'my_register/registrations' }
  resources :company_reviews
  resources :company_news
  resources :company_clients
  resources :company_comments
  resources :company_contacts
  resources :companies do
    resources :vacancies
  end
  resources :resume_contacts
  resources :resume_works
  resources :resume_recomendations
  resources :resume_posts
  resources :resume_exams
  resources :resume_courses
  resources :resumes
  root to: 'main#index'
  get 'all_resumes', to: 'resumes#all', as: :all_resume
  post 'send_answer/resume/:resume/company/:company', to: 'resume_answer#answer', as: :send_answer
  get 'view_answers/:resume', to: 'resume_answer#view_answers', as: :view_answers
  get 'all_vacancies/', to: 'vacancies#index', as: :all_vacancies
  get 'all_company_vacancies/:company', to: 'company_vacancies#index', as: :all_vacancy
  get 'search_result', to: 'search#search'
  post 'search_result', to: 'search#search'
  # resources :users
end
