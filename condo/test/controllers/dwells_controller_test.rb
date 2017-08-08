require 'test_helper'

class DwellsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @dwell = dwells(:one)
  end

  test "should get index" do
    get dwells_url
    assert_response :success
  end

  test "should get new" do
    get new_dwell_url
    assert_response :success
  end

  test "should create dwell" do
    assert_difference('Dwell.count') do
      post dwells_url, params: { dwell: { cost_per_size: @dwell.cost_per_size, lattitude: @dwell.lattitude, link: @dwell.link, longitude: @dwell.longitude, name: @dwell.name, price: @dwell.price, ref_id: @dwell.ref_id, size: @dwell.size, type: @dwell.type } }
    end

    assert_redirected_to dwell_url(Dwell.last)
  end

  test "should show dwell" do
    get dwell_url(@dwell)
    assert_response :success
  end

  test "should get edit" do
    get edit_dwell_url(@dwell)
    assert_response :success
  end

  test "should update dwell" do
    patch dwell_url(@dwell), params: { dwell: { cost_per_size: @dwell.cost_per_size, lattitude: @dwell.lattitude, link: @dwell.link, longitude: @dwell.longitude, name: @dwell.name, price: @dwell.price, ref_id: @dwell.ref_id, size: @dwell.size, type: @dwell.type } }
    assert_redirected_to dwell_url(@dwell)
  end

  test "should destroy dwell" do
    assert_difference('Dwell.count', -1) do
      delete dwell_url(@dwell)
    end

    assert_redirected_to dwells_url
  end
end
