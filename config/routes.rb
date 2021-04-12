Rails.application.routes.draw do

    root 'homes#top'
    get 'home/about' => 'homes#about'
    devise_for :users
    resources :books
    resources :users, only: [:index, :show, :edit, :update]
    # patch 'books/:id' => 'books#update', as:'update_book'
    # delete 'books/:id' => 'books#destroy', as:'destroy_book'
end