require 'test_helper'

class TodosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @todo = todos(:buy_milk)
  end

  test 'should create todo' do
    assert_difference('Todo.count') do
      post todos_url,
           params: {
             text: 'Протестировать POST',
             isCompleted: false,
             project_id: Project.first.id
           },
           as: :json
    end

    assert @response.headers['Location'].match?(/^\/todos\/\d+$/)
    assert @response.body.empty?
    assert_response :created
  end

  test 'should update todo' do
    todo = Todo.first
    assert_changes -> { todo.isCompleted? } do
      patch todo_url(project_id: todo.project_id, id: todo.id),
            params: { isCompleted: !todo.isCompleted? },
            as: :json
      todo.reload # Updating local copy of object
    end

    assert_equal 'application/json; charset=utf-8', @response.headers['Content-Type'].downcase

    json = ActiveSupport::JSON.decode @response.body
    assert_instance_of Hash, json
    refute json.empty?
  end
end
