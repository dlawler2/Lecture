Rails.application.routes.draw do
  #resources :comments
  get 'rental/index'

  get 'rental/show/:id' => 'rental#show', :as => 'rental_show'

  #devise_for :user
  devise_for :models

  #resources :movies
  resources :movies do
    get 'page/:page', :action => :index, :on => :collection
    resources :comments
    #delete 'movie/:id/comments/:comment_id', :controller => :comments, :action => :destroy, :as => "destroy comment"
  end
  get 'people/index'

  resources :products
  get 'home' => "page#home"

  get 'about_us' => "page#about_us"

  #get 'contact_us' => "page#contact_us"
  #post 'contact_us' => "page#contact_us"
  match "contact_us" => "page#contact_us", :via => [:post, :get]

  #get 'products' => "page#products"

  get 'newsletter' => "page#newsletter"

  #get 'log' => "page#log"

  get 'calendar(/:year(/:month))' => "page#calendar", :as => 'calendar'

  get 'articles' => "page#articles"

  get 'login' => "page#login"

  get 'teach' => "dustin#teach"

  get 'speak' => "dustin#speak"

  get 'dig' => "dustin#dig"

  get 'hello' => "say#hello"
  get 'goodbye' => "say#goodbye" #goodbye is method is say controller
  get 'something' => "say#something"

  # get 'mask/mask' => 'say#hello'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'page#home'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  # 
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
  #     #     resources :sales do
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
  #     #   end
end