require 'test_helper'

class ZillowDetailsControllerTest < ActionController::TestCase
  setup do
    @zillow_detail = zillow_details(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:zillow_details)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create zillow_detail" do
    assert_difference('ZillowDetail.count') do
      post :create, zillow_detail: { area: @zillow_detail.area, baths: @zillow_detail.baths, beds: @zillow_detail.beds, lastSold: @zillow_detail.lastSold, lastSoldDate: @zillow_detail.lastSoldDate, latitude: @zillow_detail.latitude, longitude: @zillow_detail.longitude, lot: @zillow_detail.lot, property_id: @zillow_detail.property_id, useCode: @zillow_detail.useCode, year: @zillow_detail.year, zEstimate: @zillow_detail.zEstimate, zEstimateDate: @zillow_detail.zEstimateDate, zRentEstimate: @zillow_detail.zRentEstimate, zRentEstimateDate: @zillow_detail.zRentEstimateDate, zillowDetails: @zillow_detail.zillowDetails, zpid: @zillow_detail.zpid }
    end

    assert_redirected_to zillow_detail_path(assigns(:zillow_detail))
  end

  test "should show zillow_detail" do
    get :show, id: @zillow_detail
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @zillow_detail
    assert_response :success
  end

  test "should update zillow_detail" do
    patch :update, id: @zillow_detail, zillow_detail: { area: @zillow_detail.area, baths: @zillow_detail.baths, beds: @zillow_detail.beds, lastSold: @zillow_detail.lastSold, lastSoldDate: @zillow_detail.lastSoldDate, latitude: @zillow_detail.latitude, longitude: @zillow_detail.longitude, lot: @zillow_detail.lot, property_id: @zillow_detail.property_id, useCode: @zillow_detail.useCode, year: @zillow_detail.year, zEstimate: @zillow_detail.zEstimate, zEstimateDate: @zillow_detail.zEstimateDate, zRentEstimate: @zillow_detail.zRentEstimate, zRentEstimateDate: @zillow_detail.zRentEstimateDate, zillowDetails: @zillow_detail.zillowDetails, zpid: @zillow_detail.zpid }
    assert_redirected_to zillow_detail_path(assigns(:zillow_detail))
  end

  test "should destroy zillow_detail" do
    assert_difference('ZillowDetail.count', -1) do
      delete :destroy, id: @zillow_detail
    end

    assert_redirected_to zillow_details_path
  end
end
