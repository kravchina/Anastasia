Anastasia::Application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
   root 'index#index'
   devise_for :users
   namespace :api do
     devise_for :user, :controllers => {sessions: 'sessions'}
   end


   #devise_for :user, :controllers => {sessions: 'sessions'}

   #namespace :api, defaults: { format: :json } do
   #   devise_for :users
   #end


   post 'api/user/register' => 'user#register'
   post 'api/user/login' => 'user#login'
   post 'api/user/logout' => 'user#logout'

   get 'api/index/getVideos' => 'video#get_videos'
   get 'api/index/getBooks' => 'book#get_books'
   get 'api/index/randomBooks' => 'book#random_books'
   get 'api/index/getArticles' => 'article#get_articles'

   get 'api/category/getAll' => 'category#get_all'
   get 'api/category/getCategories' => 'category#get_categories'
   get 'api/level/getAll' => 'level#get_all'
   get 'api/language/getAll' => 'language#get_all'
   get 'templates/home' => 'high_voltage/pages#show', id: 'home'
  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end
  
  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
