Rails.application.routes.draw do
  resources :company_vacancies
  resources :company_reviews
  resources :company_news
  resources :company_clients
  resources :company_comments
  resources :company_contacts
  resources :companies
  resources :resume_contacts
  resources :resume_works
  resources :resume_recomendations
  resources :resume_posts
  resources :resume_exams
  resources :resume_courses
  resources :resumes
  root to: 'visitors#index'
  devise_for :users
  resources :users
end
