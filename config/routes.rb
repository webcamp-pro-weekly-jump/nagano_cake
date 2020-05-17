Rails.application.routes.draw do
  
  devise_for :admins, controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
  registrations: 'admins/registrations'
}
 
  namespace :admin do
  	resources :products, only:[:new, :index, :show, :edit, :create, :update]
  	resources :genres, only:[:new, :create, :index, :edit, :update]
  end
  patch '/admin/genres/:id/edit' => 'admin/genres#update' #ルーティングエラー発生のため追記
  post '/admin/products/new' => 'admin/products#create' #ルーティングエラー発生のため追記
  patch '/admin/products/:id/edit' => 'admin/products#update' #同上

  
  devise_for :members, controllers: {
  sessions:      'members/sessions',
  passwords:     'members/passwords',
  registrations: 'members/registrations'
}
  resources :cart_items, only:[:index, :update, :destroy, :create]
  delete 'cart_item/:id/empty', to: 'cart_item#destroy_all'

  resources :products, only:[:index, :show]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
