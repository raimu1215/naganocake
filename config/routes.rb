Rails.application.routes.draw do
  
# 顧客用

# URL /customers/sign_in ...
devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}
  scope module: :public do
    root to: "homes#top"
    get 'home/about' => 'homes#about', as: 'about'
    patch 'customers/update', to: 'customers#update', as: 'update'
    post 'customers/withdrawal', to: 'customers#withdrawal', as: 'withdrawal'
    post 'orders/confirmation', to: 'orders#confirmation'
    get 'orders/thanks', to: 'orders#thanks'
    post 'orders/new', to: 'orders#new'
    resources :items, only: [:index, :show]
    resources :customers, only: [:show, :edit, :update, :destroy]
    resources :cart_items, only: [:index, :update, :destroy, :create]
    resources :orders, only: [:new, :update, :index, :show]
    resources :address, only: [:index, :edit, :create, :update, :destroy]
  end

# 管理者用

# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}
  namespace :admin do
    root to: "homes#top"
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :status, only: [:show, :update]
    resources :making_status, only: [:update]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
