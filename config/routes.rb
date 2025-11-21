Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"

  # Root path
  root "snaps#index"

  # Users
  resources :users

  # Dogs
  resources :dogs

  # Snaps
  resources :snaps do
    member do
      patch :highlight  # /snaps/:id/highlight
    end

    # Nested Snap Reaction
    resources :snap_reactions, only: [ :create, :destroy ]
  end

  # Meetups
  resources :meetups do
    member do
      post :join         # /meetups/:id/join
      delete :leave      # /meetups/:id/leave
    end

    # Nested Meetup Attendance
    resource :meetup_attendance, only: [ :create, :destroy ]

    # Nested feedback form
    resources :trust_feedbacks, only: [:create]
  end

  # Parks (optional)
  resources :parks, only: [ :index, :show ]

  # You can add authentication routes here later (Devise)
  # devise_for :users
end
