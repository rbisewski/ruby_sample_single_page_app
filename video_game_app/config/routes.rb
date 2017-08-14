Rails.application.routes.draw do
  get 'games(.:format)', to: 'games#index', as: :games
  get 'games/:id(.:format)', to: 'games#show', as: :game
  post 'likes(.:format)', to: 'likes#create', as: :like_create
  get 'likes(.:format)', to: 'likes#index', as: :likes
  get 'likes/:id(.:format)', to: 'likes#show', as: :like
  get root 'application#index'
end
