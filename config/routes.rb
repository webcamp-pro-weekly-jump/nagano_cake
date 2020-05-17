Rails.application.routes.draw do
  
  devise_for :admins, controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
  registrations: 'admins/registrations'
}

  namespace :admins do
  	resources :products, only:[:new, :index, :show, :edit, :create, :update]
  	resources :genres, only:[:new, :create, :index, :edit, :update]
  end
  patch '/admins/genres/:id/edit' => 'admins/genres#update' #ルーティングエラー発生のため追記
  post '/admins/products/new' => 'admins/products#create' #ルーティングエラー発生のため追記
  patch '/admins/products/:id/edit' => 'admins/products#update' #同上


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

  resources :members
  #退会処理のルーティング
  patch '/members/:id/hide' => 'members#hide', as: 'members_hide'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
