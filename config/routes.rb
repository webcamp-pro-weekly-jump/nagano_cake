Rails.application.routes.draw do

  devise_for :admins, controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
  registrations: 'admins/registrations'
}
devise_for :members, controllers: {
  sessions:      'members/sessions',
  passwords:     'members/passwords',
  registrations: 'members/registrations'
}
  namespace :admins do
  	root 'homes#top'
  	resources :products, only:[:new, :index, :show, :edit, :create, :update] #商品ページ作成の為
  	resources :genres, only:[:new, :create, :index, :edit, :update] #ジャンルページ作成の為
    resources :members, only:[:index, :show, :edit, :update] #会員のページ作成の為
    resources :orders, only:[:index, :show, :update]
    resources :order_items, only:[:update]

  end
  patch '/admins/genres/:id/edit' => 'admins/genres#update' #ルーティングエラー発生のため追記
  post '/admins/products/new' => 'admins/products#create' #ルーティングエラー発生のため追記
  patch '/admins/products/:id/edit' => 'admins/products#update' #同上
  patch '/admins/members/:id/edit' => 'admins/members#update' #同上


  #会員側の処理
  
  root 'homes#top'

  resources :orders, only: [:new, :index, :create, :show]
  post 'orders/order_show' => 'orders#order_show', as: 'order_order_show'
  get 'orders/success' => 'orders#success', as: 'order_success'

  resources :cart_items, only:[:index, :update, :destroy, :create]
  delete 'cart_item/empty', to: 'cart_items#destroy_all', as: 'empty_path'

  resources :products, only:[:index, :show]

  resources :members
  #退会処理のルーティング
  put 'hide' => 'members#hide'
  patch 'hide' => 'members#hide'
  get 'quit' => 'members#quit'

  resources :address, only:[:index, :update, :destroy, :create, :edit]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
