require 'test_helper'

class EventpostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @eventpost = eventposts(:one)
  end

  test "should get index" do
    get eventposts_url
    assert_response :success
  end

  test "should get new" do
    get new_eventpost_url
    assert_response :success
  end

  test "should create eventpost" do
    assert_difference('Eventpost.count') do
      post eventposts_url, params: { eventpost: { post: @eventpost.post } }
    end

    assert_redirected_to eventpost_url(Eventpost.last)
  end

  test "should show eventpost" do
    get eventpost_url(@eventpost)
    assert_response :success
  end

  test "should get edit" do
    get edit_eventpost_url(@eventpost)
    assert_response :success
  end

  test "should update eventpost" do
    patch eventpost_url(@eventpost), params: { eventpost: { post: @eventpost.post } }
    assert_redirected_to eventpost_url(@eventpost)
  end

  test "should destroy eventpost" do
    assert_difference('Eventpost.count', -1) do
      delete eventpost_url(@eventpost)
    end

    assert_redirected_to eventposts_url
  end
end
