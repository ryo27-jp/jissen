Rails.application.routes.draw do
  config = Rails.application.config.baukis2

  constraints host: config[:staff][:host] do
    namespace :staff, path: config[:staff][:path] do
      root "top#index"
      get "login" => "sessions#new", as: :login
      resource :session, only:[:create, :destroy] 
      resource :account, except:[:new, :create, :destroy]
    end
  end
  constraints host: config[:admin][:host] do
    namespace :admin, path: config[:admin][:path] do
      root "top#index"
      get "login" => "sessions#new", as: :login
      resource :session, only:[:create, :destroy ]
      resources :staff_members do
        # admin_staff_member_staff_events GET    /admin/staff_members/:staff_member_id/staff_events(.:format) 
        resources :staff_events, only: [:index]
      end
      # admin_staff_events GET    /admin/staff_events(.:format)   
    resources :staff_events, only:[:index]
   end
  end
  constraints host: config[:customer][:host] do
    namespace :customer, path: config[:customer][:path] do
      root "top#index"
    end
  end
end
