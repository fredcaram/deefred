require 'test_helper'

class WhenWhereControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get when_where_index_url
    assert_response :success
  end

end
