Rails.application.routes.draw do
  devise_for :users

  root 'homes#top'
  resources :books, only: [:new, :create, :index, :show, :edit, :update, :destroy]
  resources :users, only: [:show, :edit, :update]
  resources :homes, only: [:top] do
    collection do
    	get 'about'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
