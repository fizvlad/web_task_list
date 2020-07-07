require 'test_helper'

class TodoTest < ActiveSupport::TestCase
  test 'validation' do
    assert todos(:buy_milk).valid?
  end
end
