require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  test 'validation' do
    assert projects(:family).valid?
  end
end
