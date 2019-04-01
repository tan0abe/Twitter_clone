Rails.application.routes.draw do
  get '/', to: 'blogs#index'
  get 'boot', to: 'blogs#bootstrap'
  resources :blogs do
    collection do
      post :confirm
    end
  end
end