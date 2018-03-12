Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # Serve websocket cable requests in-process
  mount ActionCable.server => '/cable'

  resources :chatrooms, param: :slug do 
    collection do 
      post 'init_chatroom'
    end
  end
  resources :messages

  root to: "chatrooms#index"
end
