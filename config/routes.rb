Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :posts, only: [:show, :create]
  post 'rate' => 'posts#rate'
  get 'top' => 'posts#top'
  get 'uniq_ip' => 'posts#uniq_ip'

end
