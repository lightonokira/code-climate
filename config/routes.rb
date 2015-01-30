Rails.application.routes.draw do
  root "static#index"
  devise_for :users, :path => '', :path_names => {:sign_in => 'sign_in', :sign_out => 'sign_out', :sign_up => 'sign_up'}
  
  resources :users

  resources :programs
  resources :activities
  resources :logs, :index

  post 'activities/:id/tweet', to:'activities#tweet', as: 'tweet'
  post 'activities/:id/share', to:'activities#share', as: 'share'
  get 'activities/:id/create_event', to: 'activities#create_event', as: 'create_event'
  get 'activities/:id/create_gcal', to: 'activities#create_gcal', as: 'create_gcal'
  get 'activities/:id/attendees', to: 'activities#show_attendees', as: 'attendees_for'
  post 'activities/:id/send_mails', to: 'activities#send_mails', as: 'send_mails'

  match 'settings' => 'magicbeans#settings', via: [:get, :post], :as => :settings
  get 'settings/generate' => 'magicbeans#generate_page_token', :as => 'generate'

  scope 'api' do
    get 'programs/tags' => 'programs#search_query'
    get 'activities/tags' => 'activities#search_query'
    get 'users' => 'users#search_query'
  end
end
