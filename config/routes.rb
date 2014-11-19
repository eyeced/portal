Rails.application.routes.draw do
  resources :task_comments

  resources :tasks

  get 'tasks/assigned', to: 'tasks#assigned', as: 'tasks_assigned'
  get 'static_pages/home'

  get 'static_pages/index'
  
  get 'users/index'

  devise_for :users, path_names: { sign_in: 'login', sign_out: 'logout' }, controllers: { omniauth_callbacks: "omniauth_callbacks" }
  get 'users/:id', to: 'users#show'
  get 'users/:id/edit', to: 'users#edit', as: "edit_user"
  put 'users/:id', to: 'users#update'
  delete 'users/:id', to: 'users#delete'

  get 'task_comments/comments_for_task', path_name: "comments_for_task"


  root to: 'static_pages#home'


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
