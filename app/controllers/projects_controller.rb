class ProjectsController < ApplicationController
  def create
    project = Project.new(project_params)
    if project.save
      render plain: '', status: :created
    else
      render plain: project.errors.full_messages.join('; '), status: :unprocessable_entity
    end
  end

  def index
    render json: projects_json, status: :ok
  end

  private

  def project_params
    params.permit(:title)
  end

  def projects_json
    Project.all.to_json(
      include: {
        todos: {
          except: %i[project_id created_at updated_at]
        }
      },
      except: %i[created_at updated_at]
    )
  end
end
