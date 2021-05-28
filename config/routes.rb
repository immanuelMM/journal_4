Rails.application.routes.draw do
  root 'users#home'
  get 'tasks/show:id', to: 'tasks#show', as: 'show_task'
  get 'task/new/:id', to: 'tasks#new' , as: 'tasks_new_id'
  get 'tasks/edit/:id' , to: 'tasks#edit' , as: 'edit_task'
  post 'tasks/update/:id' , to: 'tasks#update' , as: 'tasks_update'
  delete 'tasks/destroy/:id' , to: 'tasks#destroy' , as: 'destroy_task'
  post 'tasks/create/:id', to: 'tasks#create' , as: 'create_task'

  get '/today_tasks/:id', to: 'today_tasks#index', as: 'today_tasks'

  get 'categories/new/:id', to: "categories#new" , as: 'categories_new'
  get 'categories/:id', to: 'categories#show', as: 'show_tasks'
  post 'categories/create/:id', to: 'categories#create', as: 'categories_create'
  get 'categories/edit/:id', to: 'categories#edit' , as: 'categories_edit'
  post 'categories/update/:id', to: 'categories#update' , as: 'categories_update'
  # get 'categories/destroy'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
 

  get  '/home',   to: 'users#home', as: "home"

   
  resources :users

end
