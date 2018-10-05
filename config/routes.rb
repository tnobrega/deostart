Rails.application.routes.draw do
  resource :leads, only: [:new, :create]
  resources :posts
  devise_for :users
  root to: 'posts#index'


  get '/conteudo_extra', to: 'pages#content', as: 'content'
  get '/show_me_the_leads', to: 'leads#index', as: 'show_me_the_leads'
  get '/:id' , to: 'posts#show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
