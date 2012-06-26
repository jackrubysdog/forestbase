require 'test_helper'

class RefereeControllerTest < ActionController::TestCase
  test "should get id:integer" do
    get :id:integer
    assert_response :success
  end

  test "should get name:string" do
    get :name:string
    assert_response :success
  end

  test "should get residence:string" do
    get :residence:string
    assert_response :success
  end

end
