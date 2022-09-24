Rails.application.routes.draw do
 
 root to:'homes#top'
 get 'homes/about' => 'homes#about', as:'about'
 devise_for :users


 resources :users,only:[:show,:edit,:update,:index]
 resources :books,only:[:new,:create,:index,:show,:edit,:destroy,:update]


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
