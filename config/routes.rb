Rails.application.routes.draw do
  # get 'team_ranking_releases/new'

  # get 'team_ranking_releases/create'

  # get 'team_ranking_releases/edit'

  # get 'team_ranking_releases/index'

  # get 'wrestler/new'

  # get 'wrestler/create'

  # get 'wrestler/edit'

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
  root 'outstanding_wrestlers#index'
  resources :seasons, param: :year
  resources :outstanding_wrestlers, :team_ranking_releases, :schools, :wrestlers
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
    
end



