Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :restaurants, :except => [:destroy, :edit, :update] do
    member do 
      # como hago esto a mano???????????
      resources :reviews, only: [:new, :create] 
    end
  end
end
