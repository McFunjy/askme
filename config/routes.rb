Rails.application.routes.draw do
  root to: 'questions#index'

  resources :questions do
    put :hide, on: :member
  end

  resources :users, except: %i[index]

  resource :session, only: %i[new create destroy]
end
