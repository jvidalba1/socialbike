Socialbike::Application.routes.draw do

  get "feeds/index"

  resources :sessions,      :only => [:new, :create, :destroy, :edit]
  resources :relationships, :only => [:create, :destroy]
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :pages
  resources :feeds

  #match "/auth/:provider/callback", :to => "sessions#create_twitter"

  match '/auth/:provider/callback', :to => 'sessions#create_facebook'
  match '/auth/failure', :to => redirect('/')
  match "auth/:provider/callback" => "sessions#create_twitter"

  match '/invitations/invitation_user', :to => "invitations#invitation_user"
  get '/invitations/invitation_event/:id', :to => "invitations#invitation_event", :as => "invitation_event"

  resources :events do

    collection do
      get "add_user"
    end
  end

  match '/events/new', :to => 'events#new'

  get 'oelo', :to => 'pages#oelo'

  match '/wikiloc',    :to => 'pages#wikiloc'
  match '/oelo',      :to => 'pages#oelo'
  match '/signup',		:to => 'users#new'
  match '/signin',    :to => 'sessions#new'
  match '/signout',   :to => 'sessions#destroy'

  root :to => 'pages#index'

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.


  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
