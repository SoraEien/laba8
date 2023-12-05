Rails.application.routes.draw do
  get 'sequences', to: 'sequences#index'
  get 'sequences/result', to: 'sequences#result'
  root 'sequences#index'
end