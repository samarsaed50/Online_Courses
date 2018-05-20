Rails.application.routes.draw do
  resources :comments
  mount Ckeditor::Engine => '/ckeditor'
  resources :lectures do
  member do
    put "like", to: "lectures#like"
    put "dislike", to: "lectures#dislike"
    put "spam", to: "lectures#spam"
    put "unspam", to: "lectures#unspam"
  end
  end 
  resources :courses
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  root to: 'courses#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
