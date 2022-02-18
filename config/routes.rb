Rails.application.routes.draw do

  # devise_for :usersは、deviseを使用する際にURLとしてusersを含む
  devise_for :users

  root to:'homes#top'

  resources :post_images, only: [:new, :create, :index, :show, :destroy] do
    resources :post_comments, only: [:create, :destroy]
  end

end
