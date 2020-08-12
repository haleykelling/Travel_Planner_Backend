require 'test_helper'

class TransportationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @transportation = transportations(:one)
  end

  test "should get index" do
    get transportations_url, as: :json
    assert_response :success
  end

  test "should create transportation" do
    assert_difference('Transportation.count') do
      post transportations_url, params: { transportation: { address: @transportation.address, details: @transportation.details, end_time: @transportation.end_time, multiday: @transportation.multiday, name: @transportation.name, start_time: @transportation.start_time, type_of_activity: @transportation.type_of_activity } }, as: :json
    end

    assert_response 201
  end

  test "should show transportation" do
    get transportation_url(@transportation), as: :json
    assert_response :success
  end

  test "should update transportation" do
    patch transportation_url(@transportation), params: { transportation: { address: @transportation.address, details: @transportation.details, end_time: @transportation.end_time, multiday: @transportation.multiday, name: @transportation.name, start_time: @transportation.start_time, type_of_activity: @transportation.type_of_activity } }, as: :json
    assert_response 200
  end

  test "should destroy transportation" do
    assert_difference('Transportation.count', -1) do
      delete transportation_url(@transportation), as: :json
    end

    assert_response 204
  end
end
