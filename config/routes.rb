Rails.application.routes.draw do

  resources :about_graduates
  resources :graduate_bank_requesits
  resources :graduate_requesits
  resources :graduates
  resources :institutions
  resources :abouts
  resources :requesits
  resources :bank_requesits
  resources :new_companies
  get 'menu', to: 'menu#menu'
  resources :menu_items
  resources :menu_categories
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
  resources :vacancies
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
  get '/tests' => 'static_pages#tests'

  get '/experts' => 'static_pages#experts'
  get '/club' => 'static_pages#club'
  get '/pricelist' => 'static_pages#pricelist'
  get '/e_learning' => 'static_pages#e_learning'
  get '/webinars' => 'static_pages#webinars'
  get '/assesement' => 'static_pages#assesement'
  # scope 'robokassa' do
  #   match 'paid'    => 'robokassa#paid',    :as => :robokassa_paid # to handle Robokassa push request

  #   match 'success' => 'robokassa#success', :as => :robokassa_success # to handle Robokassa success redirect
  #   match 'fail'    => 'robokassa#fail',    :as => :robokassa_fail # to handle Robokassa fail redirect
  # end
  # resources :users
end
