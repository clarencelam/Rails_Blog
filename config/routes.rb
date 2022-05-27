Rails.application.routes.draw do
  # Set the root route to "index" action of "articles" controller
  root "articles#index"
  # sets up conventional routes for articles resource
  resources :articles do 
    resources :comments 
  end
end
