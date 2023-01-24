Rails.application.routes.draw do
  root to: 'questions#index'
  resources :questions
  put '/questions/:id/hide', to: 'questions#hide'
end
