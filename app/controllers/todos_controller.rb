class TodosController < ApplicationController
  def create
    todo = Todo.new(todo_params)
    if todo.save
      render plain: '', status: :created, location: "/todos/#{todo.id}"
    else
      render plain: todo.errors.full_messages.join('; '), status: :unprocessable_entity
    end
  end

  def update
    todo = Todo.find(params[:id])
    if todo.update(todo_params)
      render json: todo.to_json(except: %i[created_at updated_at]), status: :ok
    else
      render plain: todo.errors.full_messages.join('; '), status: :unprocessable_entity
    end
  end

  private

  def todo_params
    params.require(:todo).permit(:text, :isCompleted, :project_id)
  end
end
