Rails.application.routes.draw do
  
  resources :comments
  resources :posts
  root 'posts#index'
  
  resources :posts do
  	resources :comments
end

    post 'delete_post/:id', to: 'posts#delete_post',as: :delete_post
    get '/:post_id/delete_comment/:id', to: 'comments#delete_comment',as: :delete_comment
    get '/trash',to: 'posts#trash',as: :trash
    get 'restore_post/:id', to: 'posts#restore_post',as: :restore_post
    get 'restore_comment/:id', to: 'posts#restore_comment',as: :restore_comment


# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
