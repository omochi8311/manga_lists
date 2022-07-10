Rails.application.routes.draw do

  root to: "public/homes#top"

  # 顧客用
  # URL /customers/sign_in ...
  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  scope module: :public do
    resources :requests
    resources :mangas
    resources :posts
    get '/posts/search' => 'posts#search'
    get '/customers/my_page' => 'customers#show'
    get '/customers/index' => 'customers#index'
    get '/customers/withdrawal' => 'customers#withdrawal'
    get '/customers/my_page/edit' => 'customers#edit'
    patch '/customers/update' => 'customers#update'
    patch '/customers/quit' => 'customers#quit'
  end

  namespace :admin do
    resources :homes
    resources :posts
    resources :mangas
    resources :genres
  end
end
