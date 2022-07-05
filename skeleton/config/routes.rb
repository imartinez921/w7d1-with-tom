Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create]
  resources :cats, except: :destroy
  resources :cat_rental_requests, only: [:new, :create] do
    member do
      post :approve
      post :deny
    end
  end

  root to: redirect('/cats')
end



# Prefix Verb  URI Pattern                                                                              Controller#Action
# users POST  /users(.:format)                                                                         users#create
# new_user GET   /users/new(.:format)                                                                     users#new
#  cats GET   /cats(.:format)                                                                          cats#index
#       POST  /cats(.:format)                                                                          cats#create
# new_cat GET   /cats/new(.:format)                                                                      cats#new
# edit_cat GET   /cats/:id/edit(.:format)                                                                 cats#edit
#   cat GET   /cats/:id(.:format)                                                                      cats#show
#       PATCH /cats/:id(.:format)                                                                      cats#update
#       PUT   /cats/:id(.:format)                                                                      cats#update
# approve_cat_rental_request POST  /cat_rental_requests/:id/approve(.:format)                                               cat_rental_requests#approve
# deny_cat_rental_request POST  /cat_rental_requests/:id/deny(.:format)                                                  cat_rental_requests#deny
# cat_rental_requests POST  /cat_rental_requests(.:format)                                                           cat_rental_requests#create
# new_cat_rental_request GET   /cat_rental_requests/new(.:format)                                                       cat_rental_requests#new