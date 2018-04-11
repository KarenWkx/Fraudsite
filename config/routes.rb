Rails.application.routes.draw do

  root to: 'icos#index'

  get 'icos/info'

  devise_for :users

  get 'user/adminpage'

  get 'user/approved'

  get 'user/pending'

  get 'user/review'

  put 'users/:id(.format)', :to => 'users#update'
  delete '/users/:id(.:format)', :to => 'users#destroy'



  resources :icos
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
