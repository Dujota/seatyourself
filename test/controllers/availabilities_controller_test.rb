require 'test_helper'

class AvailabilitiesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get availabilities_new_url
    assert_response :success
  end

  test "should get create" do
    get availabilities_create_url
    assert_response :success
  end

  test "should get edit" do
    get availabilities_edit_url
    assert_response :success
  end

  test "should get update" do
    get availabilities_update_url
    assert_response :success
  end

end
