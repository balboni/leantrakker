Rails.application.routes.draw do
  root "projects#index"

  resources :projects do  
  	resources :tasks
  	resources :comments
  end

end
