require 'test_helper'

class StockControllerTest < ActionDispatch::IntegrationTest
  test "should get trend" do
    get stock_trend_url
    assert_response :success
  end

  test "should get bg" do
    get stock_bg_url
    assert_response :success
  end

end
