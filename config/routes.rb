# frozen_string_literal: true

Rails.application.routes.draw do
  mount ActionCable.server => '/cable'

  get 'search/new'
  resources :search, only: %i[index show]

  resources :personal_messages, only: %i[new create]
  resources :conversations, only: %i[index show]

  root 'posts#index'

  devise_for :users,
             path: '',
             path_names: { sign_in: 'login', sign_out: 'logout', edit: 'profile', sign_up: 'registration' },
             controllers: { omniauth_callbacks: 'omniauth_callbacks', registrations: 'registrations' }

  resources :users, only: %i[index show]

  resources :posts, only: %i[index show create destroy] do
    resources :photos, only: [:create]
    resources :likes, only: %i[create destroy], shallow: true
    resources :comments, only: %i[index create destroy], shallow: true
    resources :bookmarks, only: %i[create destroy], shallow: true
  end

  resources :hash_tags, only: %i[index show]

  post ':id/follow_user', to: 'relationships#follow_user', as: :follow_user
  post ':id/unfollow_user', to: 'relationships#unfollow_user', as: :unfollow_user
end
