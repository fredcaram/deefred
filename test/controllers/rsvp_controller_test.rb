require 'test_helper'

class RsvpControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get rsvp_create_url
    assert_response :success
  end

  test "should get show" do
    get rsvp_show_url
    assert_response :success
  end

end
