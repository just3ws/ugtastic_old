# frozen_string_literal: true
Rails.application.routes.draw do
  get 'foo_bar_baz/index'

  devise_for :users, class_name: 'UserForm', controllers: { omniauth_callbacks: 'omniauth_callbacks', registrations: 'registrations' }
  devise_scope :user do
    get '/users/auth/:provider/upgrade' => 'omniauth_callbacks#upgrade', as: :user_omniauth_upgrade
    get '/users/auth/:provider/setup', to: 'omniauth_callbacks#setup'
  end

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
#                   Prefix Verb     URI Pattern                             Controller#Action
#        foo_bar_baz_index GET      /foo_bar_baz/index(.:format)            foo_bar_baz#index
#         new_user_session GET      /users/sign_in(.:format)                devise/sessions#new
#             user_session POST     /users/sign_in(.:format)                devise/sessions#create
#     destroy_user_session DELETE   /users/sign_out(.:format)               devise/sessions#destroy
#  user_omniauth_authorize GET|POST /users/auth/:provider(.:format)         omniauth_callbacks#passthru {:provider=>/google_oauth2/}
#   user_omniauth_callback GET|POST /users/auth/:action/callback(.:format)  omniauth_callbacks#:action
#            user_password POST     /users/password(.:format)               devise/passwords#create
#        new_user_password GET      /users/password/new(.:format)           devise/passwords#new
#       edit_user_password GET      /users/password/edit(.:format)          devise/passwords#edit
#                          PATCH    /users/password(.:format)               devise/passwords#update
#                          PUT      /users/password(.:format)               devise/passwords#update
# cancel_user_registration GET      /users/cancel(.:format)                 registrations#cancel
#        user_registration POST     /users(.:format)                        registrations#create
#    new_user_registration GET      /users/sign_up(.:format)                registrations#new
#   edit_user_registration GET      /users/edit(.:format)                   registrations#edit
#                          PATCH    /users(.:format)                        registrations#update
#                          PUT      /users(.:format)                        registrations#update
#                          DELETE   /users(.:format)                        registrations#destroy
#    user_omniauth_upgrade GET      /users/auth/:provider/upgrade(.:format) omniauth_callbacks#upgrade
#                          GET      /users/auth/:provider/setup(.:format)   omniauth_callbacks#setup
#                  sitemap GET      /sitemap(.:format)                      sitemaps#index
#               interviews GET      /interviews(.:format)                   interviews#index
#                interview GET      /interviews/:id(.:format)               interviews#show
#                 sitemaps GET      /sitemaps(.:format)                     sitemaps#index
#              conferences GET      /conferences(.:format)                  conferences#index
#               conference GET      /conferences/:id(.:format)              conferences#show
#                    users GET      /users(.:format)                        users#index
#                          POST     /users(.:format)                        users#create
#                 new_user GET      /users/new(.:format)                    users#new
#                edit_user GET      /users/:id/edit(.:format)               users#edit
#                     user GET      /users/:id(.:format)                    users#show
#                          PATCH    /users/:id(.:format)                    users#update
#                          PUT      /users/:id(.:format)                    users#update
#                          DELETE   /users/:id(.:format)                    users#destroy
#              rails_admin          /admin                                  RailsAdmin::Engine
#                          GET      /auth/:provider/callback(.:format)      sessions#create
#                   signin GET      /signin(.:format)                       sessions#new
#                  signout GET      /signout(.:format)                      sessions#destroy
#             auth_failure GET      /auth/failure(.:format)                 sessions#failure
#                     root GET      /                                       interviews#index
#                          GET      /*unmatched_route(.:format)             errors#intercept_404
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
