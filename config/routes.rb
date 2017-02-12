Rails.application.routes.draw do

  resources :contratos
  resources :configuraciones
  resources :roles
  resources :permisos
  resources :modelos
  resources :acciones
  get "/pages/:page" => "pages#show"

  root "pages#show", page: "home"
  
  resources :eventos_proyectos
  resources :descuentos
  resources :intereses
  resources :tipos_de_pago
  
  resources :estados
  resources :pagos
  resources :conceptos_de_pago
  resources :eventos
  resources :especialidades_de_contacto
  resources :contactos
  resources :roles_de_empleados
  resources :departamentos
  
  resources :actividades_proyectos
  resources :personas_proyectos
  resources :areas
  resources :actividades
  resources :etapas
  resources :proyectos do
    resources :cuotas_por_cliente
  end
  resources :miembros_equipo
  resources :tipo_documentos
  resources :ciudades
  resources :provincias
  resources :paises
  resources :personas
  resources :empleados

  match 'proyectos/:id/actividades_proyectos' => 'proyectos#actividadesProyecto',  :via => [:get], as: :actividades_del_proyecto

  #resources :users
  devise_for :users, :path => 'user', :controllers => {:registrations => "registrations"}
  #devise_for :users, :path_prefix => 'd'
  #resources :users
  match 'users' => 'users#index', :via => [:get]
  match 'users/:id/edit' => 'users#edit', :via => [:get], :as => :edit_user
  match 'users/:id' => 'users#update', via: :post, as: :update_user
  match 'users/:id' => 'users#show', :via => [:get], as: :user_show
  match 'users/:id' => 'users#destroy', :via => [:delete], as: :user


  #Audited
  match 'actividades_proyectos_audited' => 'actividades_proyectos#audited', :via => [:get], as: :actividades_proyectos_audited
  match 'conceptos_de_pago_audited' => 'conceptos_de_pago#audited', :via => [:get], as: :conceptos_de_pago_audited
  match 'contratos_audited' => 'contratos#audited', :via => [:get], as: :contratos_audited
  match 'cuotas_por_cliente_audited' => 'cuotas_por_cliente#audited', :via => [:get], as: :cuotas_por_cliente_audited
  match 'eventos_audited' => 'eventos#audited', :via => [:get], as: :eventos_audited
  match 'eventos_proyectos_audited' => 'eventos_proyectos#audited', :via => [:get], as: :eventos_proyectos_audited
  match 'proyectos_audited' => 'proyectos#audited', :via => [:get], as: :proyectos_audited
  #match 'pagos_audited' => 'pagos#audited', :via => [:get], as: :pagos_audited
  #devise_for :installs
  #match 'proyectos/:proyecto_id/actividades_proyectos/:id/historial' => 'actividades_proyectos#historial',  :via => [:get], as: :historial
  
  #match 'proyectos/:id/pagos' => 'proyectos#pagos',  :via => [:get], as: :proyecto_pagos
  #resources :empleados, controller: 'personas', type 'Empleado'
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
