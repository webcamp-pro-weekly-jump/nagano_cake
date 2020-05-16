Rails.application.routes.draw do
  devise_for :admins

  #会員側
  devise_for :members

  resources :cart_item, only:[:index, :update, :destroy, :create]
  delete 'cart_item/:id/empty', to: 'cart_item#destroy_all'

  resources :products, only:[:index, :show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
