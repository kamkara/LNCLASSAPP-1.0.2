require 'test_helper'

class LoginControllerTest < ActionDispatch::IntegrationTest
  test "should get student" do
    get login_student_url
    assert_response :success
  end

  test "should get teacher" do
    get login_teacher_url
    assert_response :success
  end

end
