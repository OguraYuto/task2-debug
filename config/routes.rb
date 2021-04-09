Rails.application.routes.draw do
    devise_for :users
    root to: 'homes#top'
    get 'home/about' => 'homes#about'
    resources :books
    post'books' => 'books#create'
    post'books' => 'books#create'
    resources :users
    patch 'books/:id' => 'books#update', as:'update_book'
    delete 'books/:id' => 'books#destroy', as:'destroy_book'
    
end