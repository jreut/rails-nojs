Rails.application.routes.draw do
  resources :chats, only: %i[index create show] do
    resource :send_message, only: %i[create]
  end
end
