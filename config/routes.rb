Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get 'tasks', to: 'tasks#index', as: :index
  get "tasks/new", to: "tasks#new", as: :new
  get "tasks/:id", to: "tasks#show", as: :task
  get "tasks/:id/edit", to: "tasks#edit", as: :edit
  post "tasks", to: "tasks#create"
  patch "tasks/:id", to: "tasks#update", as: :update
  delete "tasks/:id", to: "tasks#destroy"

  match "tasks/complete" => "tasks#complete", as: 'complete_task', via: :put
end
