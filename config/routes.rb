Rails.application.routes.draw do
    devise_for :users
    resource :dashboard, only: [:show]
    root 'static_pages#index'
    get 'privacy', to: 'static_pages#privacy'
    get 'career', to: 'static_pages#career'
    get 'team', to: 'static_pages#team'
    resources :courses, only: [:index, :show] do
        resources :enrollments, only: :create
    end
    resources :lessons, only: [:show]
    namespace :instructor do
        resources :lessons, only: [:update]
        resources :sections, only: [:update] do
            resources :lessons, only: [:create]
        end
        resources :courses, only: [:new, :create, :show] do
            resources :sections, only: [:create]
        end
    end
end
