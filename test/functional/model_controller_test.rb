require 'test_helper'

class ModelControllerTest < ActionController::TestCase
  test "should get International" do
    get :International
    assert_response :success
  end

  test "should get id:integer" do
    get :id:integer
    assert_response :success
  end

  test "should get player_id:integer" do
    get :player_id:integer
    assert_response :success
  end

  test "should get matchdate:date" do
    get :matchdate:date
    assert_response :success
  end

  test "should get competition:string" do
    get :competition:string
    assert_response :success
  end

  test "should get venue:string" do
    get :venue:string
    assert_response :success
  end

  test "should get han:string" do
    get :han:string
    assert_response :success
  end

  test "should get f:integer" do
    get :f:integer
    assert_response :success
  end

  test "should get a:integer" do
    get :a:integer
    assert_response :success
  end

  test "should get shirt:integer" do
    get :shirt:integer
    assert_response :success
  end

  test "should get on:integer" do
    get :on:integer
    assert_response :success
  end

  test "should get off:integer" do
    get :off:integer
    assert_response :success
  end

  test "should get goals:integer" do
    get :goals:integer
    assert_response :success
  end

end
