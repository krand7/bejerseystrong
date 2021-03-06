Rails.application.routes.draw do

  resources :volunteer_resources do
    member do
      get :file
    end
  end

  get 'resources', to: 'dashboard#resources'
  resources :answers
  resources :questions

  resources :schools do
    collection do
      get 'my-school', action: :my_school
    end
  end

  resources :appointments
  get 'my-appointments', to: 'appointments#my_appointments', as: 'my_appointments'
  get 'appointment-search', to: 'appointments#search'
  get 'incomplete-appointments', to: 'appointments#incomplete'

  resources :volunteers
  resources :conversations

  scope module: 'static' do
    get :home
    get :team
    get :donate
    get :contact
  end

  post :contact, to: 'static#contact_submit'

  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }

  resources :users do
    collection do
      get :new_volunteer
      post :create_volunteer
      get 'my-volunteers', action: :my_volunteers
      get 'pending-volunteers', action: :my_pending_volunteers
    end
  end

  resources :conversations do
    member do
      post :delete
    end
  end

  get 'dashboard', to: 'dashboard#show'
  get 'pending', to: 'dashboard#pending'
  get 'profile', to: 'dashboard#profile'
  get 'aggregate-report', to: 'dashboard#aggregate_report'
  patch 'change_password', to: 'dashboard#change_password', as: 'change_password'

  root 'static#home'

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
