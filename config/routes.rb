Rails.application.routes.draw do
  get '/projects', to: 'projects#index', as: 'projects'
  post '/projects', to: 'projects#create'

  post '/todos', to: 'todos#create', as: 'todos'
  patch '/projects/:project_id/todo/:id', to: 'todos#update', as: 'todo'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
