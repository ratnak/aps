require 'test_helper'

class PartiesControllerTest < ActionController::TestCase
  setup do
    @party = parties(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:parties)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create party" do
    assert_difference('Party.count') do
      post :create, party: { partyName: @party.partyName, partyType: @party.partyType, property_id: @party.property_id }
    end

    assert_redirected_to party_path(assigns(:party))
  end

  test "should show party" do
    get :show, id: @party
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @party
    assert_response :success
  end

  test "should update party" do
    patch :update, id: @party, party: { partyName: @party.partyName, partyType: @party.partyType, property_id: @party.property_id }
    assert_redirected_to party_path(assigns(:party))
  end

  test "should destroy party" do
    assert_difference('Party.count', -1) do
      delete :destroy, id: @party
    end

    assert_redirected_to parties_path
  end
end
