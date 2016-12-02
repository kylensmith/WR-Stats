Rails.application.routes.draw do


  


  # # get 'duals/show'

  # # get 'duals/edit'

  # get 'duals/index'

  # get 'searches/index'

  # get 'searches/new'

  # get 'searches/show'

  # get 'events/new'

  # get 'events/show'

  # get 'events/index'

  # get 'events/edit'

  # get 'coaches/new'

  # get 'coaches/create'

  # get 'coaches/index'

  # get 'coaches/show'

  # get 'coaches/edit'

  # get 'coaches/update'

  # get 'coaches/destroy'

  devise_for :users
  # get 'schedules/index,'

  # get 'schedules/show'

  
  # get 'team_ranking_releases/new'

  # get 'team_ranking_releases/create'

  # get 'team_ranking_releases/edit'

  # get 'team_ranking_releases/index'

  # get 'wrestler/new'

  # get 'wrestler/create'
    post 'admin/duals/masscreate2', action: :masscreate2, controller: 'admin/duals'
  
  post 'admin/duals/mass_create', action: :mass_create, controller: 'admin/duals'
    get 'admin/duals/this_week_complete', action: :this_week_complete, controller: 'admin/duals'
    get 'admin/dual_seasons/new_all_active', action: :new_all_active, controller: 'admin/dual_seasons'
    post 'admin/dual_seasons/create_all_active', action: :create_all_active, controller: 'admin/dual_seasons'
   
    get 'admin/duals/this_week', action: :this_week, controller: 'admin/duals'
  get 'admin/schools/status', action: :status, controller: 'admin/schools'
  # get 'admin/schools/create_dual_season', action: :create_dual_season, controller: 'admin/schools', 
  post 'admin/schools/change', action: :changes, controller: 'admin/schools'
  post 'admin/coaches/change_status', action: :change_status, controller: 'admin/coaches'
  
  # get 'profile', to: :show, controller: 'users'
  # get 'wrestler/edit'
match 'admin/schools/change', action: :changes, controller: 'admin/schools', via: [:get, :post]
  # get 'wrestler/index'

  # get 'school/new'

  # get 'school/create'

  # get 'school/edit'

  # get 'school/index'

  # get 'outstanding_wrestlers/index'

  # get 'outstanding_wrestlers/create'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'schedules#index'
  namespace :admin do
    # match '/duals/:id' => 'duals#updat', :as => 'admin/duals#update'
    resources :coaches, only: [:index, :update, :new, :create, :edit, :destroy]
    resources :duals, only: [:update, :new, :create, :edit, :destroy, :mass_create, :mass_create2]
    resources :wrestlers, only: [:update, :new, :create, :edit, :destroy]
    resources :users, only: [:index, :update, :edit]
    resources :dual_seasons, only: [:new, :edit, :create, :update, :destroy, :change, :new_all_active, :create_all_active] do
      # collection do
      #   put :create_multiple
      # end
    end
    resources :schools, param: :name, :constraints => { :name => /[^\/]*/ }, only: [:update, :new, :create, :edit]
    # , :dual_seasons, :team_scores
  end
  resources :seasons, param: :year
  resources :outstanding_wrestlers, :searches, :events, :team_ranking_releases, :wrestlers, :schedules, :coaches
  # Searches the name rather than the ID and uses Regex to allow for a period to work in the name
  resources :schools, param: :name, :constraints => { :name => /[^\/]*/ }
  resources :duals, only: [:index, :show]
  resources :polls, :controller=>"team_ranking_releases", :path => "poll"

  resources :schools, param: :name, :key => :name do
    resources :seasons, path: 'schedules', controller: 'schedules'
  end
  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'
  # get 'schools/:name' => 'schools#show'

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
    
end



