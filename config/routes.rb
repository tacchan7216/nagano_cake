Rails.application.routes.draw do
  namespace :admin do
    get 'customers/index'
    get 'customers/show'
    get 'customers/edit'
  end
  namespace :public do
    resources :addresses
  end
  namespace :public do
    resources :orders
  end
  namespace :public do
    resources :cart_items
  end
  namespace :public do
    resources :items
  end
  namespace :public do
    root to: 'homes#top'
    get "home/about" => "homes#about", as: "about"
  end
  namespace :admin do
    resources :orders
  end
  namespace :admin do
    resources :genres
  end
  namespace :admin do
    resources :items
  end
  namespace :admin do
    get '' => 'homes#top'
  end
  devise_for :customers, controllers: {
  sessions:      'customers/sessions',
  passwords:     'customers/passwords',
  registrations: 'customers/registrations'
}
  devise_for :admins, controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
  registrations: 'admins/registrations'
}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
