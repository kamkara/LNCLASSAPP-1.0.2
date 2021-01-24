require 'test_helper'

class HelpsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @help = helps(:one)
  end

  test "should get index" do
    get helps_url
    assert_response :success
  end

  test "should get new" do
    get new_help_url
    assert_response :success
  end

  test "should create help" do
    assert_difference('Help.count') do
      post helps_url, params: { help: { author: @help.author, content: @help.content, material_id: @help.material_id, title: @help.title, user_id: @help.user_id } }
    end

    assert_redirected_to help_url(Help.last)
  end

  test "should show help" do
    get help_url(@help)
    assert_response :success
  end

  test "should get edit" do
    get edit_help_url(@help)
    assert_response :success
  end

  test "should update help" do
    patch help_url(@help), params: { help: { author: @help.author, content: @help.content, material_id: @help.material_id, title: @help.title, user_id: @help.user_id } }
    assert_redirected_to help_url(@help)
  end

  test "should destroy help" do
    assert_difference('Help.count', -1) do
      delete help_url(@help)
    end

    assert_redirected_to helps_url
  end
end
