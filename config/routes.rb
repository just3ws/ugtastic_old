Rails.application.routes.draw do
  namespace :you_tube do
    resources :videos
  end
  resources :users
  root to: 'you_tube/videos#index'
  get '/auth/:provider/callback' => 'sessions#create'
  get '/signin' => 'sessions#new', :as => :signin
  get '/signout' => 'sessions#destroy', :as => :signout
  get '/auth/failure' => 'sessions#failure'
end

# == Route Map
#
#              Prefix Verb   URI Pattern                         Controller#Action
#     you_tube_videos GET    /you_tube/videos(.:format)          you_tube/videos#index
#                     POST   /you_tube/videos(.:format)          you_tube/videos#create
#  new_you_tube_video GET    /you_tube/videos/new(.:format)      you_tube/videos#new
# edit_you_tube_video GET    /you_tube/videos/:id/edit(.:format) you_tube/videos#edit
#      you_tube_video GET    /you_tube/videos/:id(.:format)      you_tube/videos#show
#                     PATCH  /you_tube/videos/:id(.:format)      you_tube/videos#update
#                     PUT    /you_tube/videos/:id(.:format)      you_tube/videos#update
#                     DELETE /you_tube/videos/:id(.:format)      you_tube/videos#destroy
#               users GET    /users(.:format)                    users#index
#                     POST   /users(.:format)                    users#create
#            new_user GET    /users/new(.:format)                users#new
#           edit_user GET    /users/:id/edit(.:format)           users#edit
#                user GET    /users/:id(.:format)                users#show
#                     PATCH  /users/:id(.:format)                users#update
#                     PUT    /users/:id(.:format)                users#update
#                     DELETE /users/:id(.:format)                users#destroy
#                root GET    /                                   you_tube/videos#index
#                     GET    /auth/:provider/callback(.:format)  sessions#create
#              signin GET    /signin(.:format)                   sessions#new
#             signout GET    /signout(.:format)                  sessions#destroy
#        auth_failure GET    /auth/failure(.:format)             sessions#failure
#                page GET    /pages/*id                          high_voltage/pages#show
#
