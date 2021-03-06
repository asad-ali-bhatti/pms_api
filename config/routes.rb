Rails.application.routes.draw do
  post 'user_token' => 'user_token#create'
  namespace :api do
    namespace :v1 do
      resources :users
      resources :projects do
        resources :tasks do
          resources :comments
        end
      end
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
