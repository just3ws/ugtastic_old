Rails.application.routes.draw do
  get 'sitemap' => 'sitemaps#index'

  resources :interviews, only: %i(index show)
  resources :sitemaps, only: %i(index)
  resources :conferences, only: %i(index show)
  resources :users

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get '/auth/:provider/callback' => 'sessions#create'
  get '/signin' => 'sessions#new', as: :signin
  get '/signout' => 'sessions#destroy', as: :signout
  get '/auth/failure' => 'sessions#failure'

  root to: 'interviews#index'

  # last rule for unmatched requests
  get '*unmatched_route', to: 'errors#intercept_404'
end

# == Route Map
#
#       Prefix Verb   URI Pattern                        Controller#Action
#      sitemap GET    /sitemap(.:format)                 sitemaps#index
#   interviews GET    /interviews(.:format)              interviews#index
#    interview GET    /interviews/:id(.:format)          interviews#show
#     sitemaps GET    /sitemaps(.:format)                sitemaps#index
#  conferences GET    /conferences(.:format)             conferences#index
#   conference GET    /conferences/:id(.:format)         conferences#show
#        users GET    /users(.:format)                   users#index
#              POST   /users(.:format)                   users#create
#     new_user GET    /users/new(.:format)               users#new
#    edit_user GET    /users/:id/edit(.:format)          users#edit
#         user GET    /users/:id(.:format)               users#show
#              PATCH  /users/:id(.:format)               users#update
#              PUT    /users/:id(.:format)               users#update
#              DELETE /users/:id(.:format)               users#destroy
#  rails_admin        /admin                             RailsAdmin::Engine
#              GET    /auth/:provider/callback(.:format) sessions#create
#       signin GET    /signin(.:format)                  sessions#new
#      signout GET    /signout(.:format)                 sessions#destroy
# auth_failure GET    /auth/failure(.:format)            sessions#failure
#         root GET    /                                  interviews#index
#              GET    /*unmatched_route(.:format)        errors#intercept_404
#
# Routes for RailsAdmin::Engine:
#     dashboard GET         /                                      rails_admin/main#dashboard
#         index GET|POST    /:model_name(.:format)                 rails_admin/main#index
#           new GET|POST    /:model_name/new(.:format)             rails_admin/main#new
#        export GET|POST    /:model_name/export(.:format)          rails_admin/main#export
#   bulk_delete POST|DELETE /:model_name/bulk_delete(.:format)     rails_admin/main#bulk_delete
# history_index GET         /:model_name/history(.:format)         rails_admin/main#history_index
#   bulk_action POST        /:model_name/bulk_action(.:format)     rails_admin/main#bulk_action
#          show GET         /:model_name/:id(.:format)             rails_admin/main#show
#          edit GET|PUT     /:model_name/:id/edit(.:format)        rails_admin/main#edit
#        delete GET|DELETE  /:model_name/:id/delete(.:format)      rails_admin/main#delete
#   show_in_app GET         /:model_name/:id/show_in_app(.:format) rails_admin/main#show_in_app
#  history_show GET         /:model_name/:id/history(.:format)     rails_admin/main#history_show
#
