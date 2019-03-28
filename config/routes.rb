Rails.application.routes.draw do
  resources :blogs do
    get '/blogs' to: 'blogs#index'
    collection do  #idなどを必要としない固有のルーティングを作成(member doとするとidを必要とする固有のルーティングを作成する)
      post :confirm
    end
  end
end