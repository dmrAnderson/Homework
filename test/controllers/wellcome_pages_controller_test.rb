require 'test_helper'

class WellcomePagesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get wellcome_pages_index_url
    assert_response :success
  end

end
