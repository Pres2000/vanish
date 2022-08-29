Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # get "restaurants/:id", to: "restaurants#show", as: :restaurant
  get "vans", to: "vans#index", as: :vans
  get "vans/new", to: "vans#new", as: :new_vans
  post "vans", to: "vans#create"
end



# # CRUD
#   # READ ALL
#   get 'tasks', to: 'tasks#index', as: :index
#   # CREATE
#   get 'tasks/new', to: 'tasks#new', as: :new_tasks
#   post 'tasks', to: 'tasks#create'
#   # READ ONE
#   get "tasks/:id", to: "tasks#show", as: :task
#   # UPDATE
#   get "tasks/:id/edit", to: "tasks#edit", as: :edit_task
#   patch "tasks/:id", to: "tasks#update"
#   # DELETE
#   delete "tasks/:id", to: "tasks#destroy"
