Rails.application.routes.draw do
  resources :company_practices
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
  mount Robokassa::Engine => "/robokassa", :as => "robokassa"
  
  get '/career_cards' => 'static_pages#career_cards'
  get '/marketing' => 'static_pages#marketing'
  get '/about_payment' => 'static_pages#about_payment'
  get '/requesits' => 'static_pages#requesits'
  get '/oferta' => 'static_pages#oferta'
  get '/games' => 'static_pages#games'
  get '/catalog' => 'static_pages#catalog'
  get '/about' => 'static_pages#about'
  # scope 'robokassa' do
  #   match 'paid'    => 'robokassa#paid',    :as => :robokassa_paid # to handle Robokassa push request

  #   match 'success' => 'robokassa#success', :as => :robokassa_success # to handle Robokassa success redirect
  #   match 'fail'    => 'robokassa#fail',    :as => :robokassa_fail # to handle Robokassa fail redirect
  # end
  # resources :users
end
