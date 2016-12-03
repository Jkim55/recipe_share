Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :recipes do
    resources :comments
    member do
      put "like", to: "recipes#upvote"
    end
  end

  root "recipes#index"
end
