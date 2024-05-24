require "test_helper"

class EnquiriesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get enquiries_index_url
    assert_response :success
  end
end
