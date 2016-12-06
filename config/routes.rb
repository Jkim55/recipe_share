Rails.application.routes.draw do
  devise_for :users
  resources :recipes do
    resources :comments
    member do
      put "like", to: "recipes#upvote"
    end
  end

  root "landing#index"
end
