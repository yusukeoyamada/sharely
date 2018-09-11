Rails.application.routes.draw do
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
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show, :edit, :update]

  # お気に入り機能
  resources :fav_ques, only: [:create, :destroy]
  resources :fav_rpts, only: [:create, :destroy]
end
