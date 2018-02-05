require 'test_helper'

class RetrieveFilesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get retrieve_files_index_url
    assert_response :success
  end

  test "should get show" do
    get retrieve_files_show_url
    assert_response :success
  end

end
