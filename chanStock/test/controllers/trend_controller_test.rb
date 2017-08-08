require 'test_helper'

class TrendControllerTest < ActionDispatch::IntegrationTest
  test "should get bg" do
    get trend_bg_url
    assert_response :success
  end

end
