Rails.application.routes.draw do
  devise_for :admins, controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
  registrations: 'admins/registrations'
}

  #会員側の処理
  devise_for :members, controllers: {
  sessions:      'members/sessions',
  passwords:     'members/passwords',
  registrations: 'members/registrations'
}
  root 'homes#top'
  resources :cart_items, only:[:index, :update, :destroy, :create]
  delete 'cart_item/:id/empty', to: 'cart_item#destroy_all'

  resources :products, only:[:index, :show]

  resources :members, only:[:show]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
