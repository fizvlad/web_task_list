class ProjectsController < ApplicationController
  def index
    render json: projects_json, status: :ok
  end

  private

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
