Rails.application.routes.draw do
  #ユーザーによる記事投稿関係
  resources :reports do
    collection do
      post :confirm
    end
  end

  #ユーザーによる質問関係
  resources :questions do
    resources :answers

    collection do
      post :confirm
    end
  end

  #ログイン関係
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show, :edit, :update]
end
