require 'test_helper'

class ScaffoldControllerTest < ActionController::TestCase
  test "should get Photo" do
    get :Photo
    assert_response :success
  end

  test "should get link:string" do
    get :link:string
    assert_response :success
  end

  test "should get image_url:string" do
    get :image_url:string
    assert_response :success
  end

  test "should get event_id:integer" do
    get :event_id:integer
    assert_response :success
  end

end
