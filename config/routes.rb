Rails.application.routes.draw do
  
  resources :eventos_proyectos
  resources :descuentos
  resources :intereses
  resources :tipos_de_pago
  devise_for :users
  resources :estados
  resources :cuotas_por_cliente
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
  resources :proyectos
  resources :miembros_equipo
  resources :tipo_documentos
  resources :ciudades
  resources :provincias
  resources :paises
  resources :personas
  resources :empleados

  match 'proyectos/:id/actividades_proyectos' => 'proyectos#actividadesProyecto',  :via => [:get], as: :actividades_del_proyecto

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
