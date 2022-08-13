Rails.application.routes.draw do

  root to: "public/homes#top"
  get 'admin/customers/manga_index' => 'admin/customers#mangas_index'
  get 'admin' => 'admin/requests#top'


  # 顧客用
  # URL /customers/sign_in ...
  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  devise_scope :customer do
    post 'customer/guest_sign_in', to: 'public/sessions#guest_sign_in'
  end

  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


  scope module: :public do
    resources :mangas
    #resources :posts
    get '/posts', to: 'posts#index', as: "posts"
    get '/mangas/:manga_id/post/new', to: 'posts#new', as: "manga_post_new"
    post '/mangas/:manga_id/post', to: 'posts#create', as: "manga_post_create"
    get '/mangas/:manga_id/post/:post_id/edit', to: 'posts#edit', as: "manga_post_edit"
    get '/mangas/:manga_id/post/:post_id/show', to: 'posts#show', as: "manga_post_show"
    patch '/mangas/:manga_id/post/:post_id', to: 'posts#update', as: "manga_post_update"

    get '/requests/completion' => 'requests#completion'
    get '/requests' => 'requests#new'
    post '/requests' => 'requests#create'
    get '/customers/my_page' => 'customers#show'
    get '/customers/index' => 'customers#index'
    get '/customers/withdrawal' => 'customers#withdrawal'
    get '/customers/my_page/edit' => 'customers#edit'
    get '/customers/page', to: 'customers#page', as: "manga_page"
    get '/customers/:id/postlist', to: 'customers#postlist', as: "manga_post_list"
    patch '/customers/update' => 'customers#update'
    patch '/customers/quit' => 'customers#quit'
  end

  namespace :admin do
    resources :homes
    resources :mangas
    resources :genres
    resources :customers
    resources :requests
    resources :posts do
    collection do
      get 'search'
    end
  end
  end
end
