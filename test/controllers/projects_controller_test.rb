require 'test_helper'

class ProjectsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @project = projects(:family)
  end

  test 'should get index' do
    get projects_url, as: :json
    assert_response :success

    assert_equal 'application/json; charset=utf-8', @response.headers['Content-Type'].downcase

    json = ActiveSupport::JSON.decode @response.body
    assert_instance_of Array, json
    refute json.empty?
  end

  test 'should create project' do
    assert_difference('Project.count') do
      post projects_url, params: { title: 'Тестирование' }, as: :json
    end

    assert @response.headers['Location'].match?(/^\/projects\/\d+$/)
    assert @response.body.empty?
    assert_response :created
  end
end
