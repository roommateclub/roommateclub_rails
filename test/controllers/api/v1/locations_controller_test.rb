require 'test_helper'

class Api::V1::LocationsControllerTest < ActionController::TestCase
  test "should get districts_index" do
    get :districts_index
    assert_response :success
  end

end
