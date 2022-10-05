Rails.application.routes.draw do
  require 'sidekiq/web'
  require 'sidekiq-scheduler/web'
  
  # Configure Sidekiq-specific session middleware
  scope :sidekiq do
    Sidekiq::Web.use ActionDispatch::Cookies
    Sidekiq::Web.use ActionDispatch::Session::CookieStore, key: "_interslice_session"
    Sidekiq::Web.use Rack::Auth::Basic do |username, password|
      ActiveSupport::SecurityUtils.secure_compare(::Digest::SHA256.hexdigest(username), ::Digest::SHA256.hexdigest(ENV["SIDEKIQ_USERNAME"])) &
        ActiveSupport::SecurityUtils.secure_compare(::Digest::SHA256.hexdigest(password), ::Digest::SHA256.hexdigest(ENV["SIDEKIQ_PASSWORD"]))
    end
    
    mount Sidekiq::Web, at: ''
  end
  
  root to: 'listings#index'
  
  devise_for :users

  resources :listings, except: [:edit, :update] do
    resources :reviews, only: [] do 
      collection do
        get :collected_texts
      end
    end
    
    member do
      get :collected_reviews
    end
  end

end
