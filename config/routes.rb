Rails.application.routes.draw do
  root to: 'questions#index'
  resources :questions
  put '/questions/:id/hide', to: 'questions#hide'

  resources :users, except: %i[index]

  resource :session, only: %i[new create destroy]
end
