Rails.application.routes.draw do
  
  root :to =>'homes#index'

  # お問い合わせ関係
  resources :contacts

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

  # ユーザーによる記事投稿関係
  resources :reports do
    collection do
      post :confirm
    end
  end

  # ユーザーによる質問関係
  resources :questions do
    resources :answers

    collection do
      post :confirm
    end
  end

  # ログイン関係
  devise_for :users, controllers: {
    registrations: "users/registrations",
    omniauth_callbacks: "users/omniauth_callbacks"
  }

  # お気に入り機能
  resources :fav_ques, only: [:create, :destroy]
  resources :fav_rpts, only: [:create, :destroy]
end
