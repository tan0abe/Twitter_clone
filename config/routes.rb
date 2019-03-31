Rails.application.routes.draw do
  get '/', to: 'blogs#index'
  get 'boot', to: 'blogs#bootstrap'
  get 'temp', to: 'blogs#template'
  resources :blogs do
    collection do  #idなどを必要としない固有のルーティングを作成(member doとするとidを必要とする固有のルーティングを作成する)
      post :confirm
    end
  end
end