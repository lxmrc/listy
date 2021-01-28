Rails.application.routes.draw do
  resources :tasks do
    member do
      get 'complete'
      get 'uncomplete'
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
