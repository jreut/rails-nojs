Rails.application.routes.draw do
  resource :session, only: %i[new create destroy]

  resources :chats, only: %i[index create show] do
    resource :send_message, only: %i[create]
  end
end
