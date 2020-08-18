require 'test_helper'

class AccomodationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @accomodation = accomodations(:one)
  end

  test "should get index" do
    get accomodations_url, as: :json
    assert_response :success
  end

  test "should create accomodation" do
    assert_difference('Accomodation.count') do
      post accomodations_url, params: { accomodation: { address: @accomodation.address, latitude: @accomodation.latitude, longitude: @accomodation.longitude, name: @accomodation.name } }, as: :json
    end

    assert_response 201
  end

  test "should show accomodation" do
    get accomodation_url(@accomodation), as: :json
    assert_response :success
  end

  test "should update accomodation" do
    patch accomodation_url(@accomodation), params: { accomodation: { address: @accomodation.address, latitude: @accomodation.latitude, longitude: @accomodation.longitude, name: @accomodation.name } }, as: :json
    assert_response 200
  end

  test "should destroy accomodation" do
    assert_difference('Accomodation.count', -1) do
      delete accomodation_url(@accomodation), as: :json
    end

    assert_response 204
  end
end
