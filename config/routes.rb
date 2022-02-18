Rails.application.routes.draw do

  # devise_for :usersは、deviseを使用する際にURLとしてusersを含む
  devise_for :users

  root to:'homes#top'

end
