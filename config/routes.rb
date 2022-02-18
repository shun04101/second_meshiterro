Rails.application.routes.draw do

  # devise_for :usersは、deviseを使用する際にURLとしてusersを含む
  devise_for :users

  root to:'homes#top'

  resources :post_images, only: [:new, :create, :index, :show, :destroy] do
    resources :post_comments, only: [:create, :destroy]
    # favoritesのshowページが不要で、idの受け渡しも必要ないので、resourceとなる
    resource :favorites, only: [:create, :destroy]
  end

end
