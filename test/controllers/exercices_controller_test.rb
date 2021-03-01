require 'test_helper'

class ExercicesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @exercice = exercices(:one)
  end

  test "should get index" do
    get exercices_url
    assert_response :success
  end

  test "should get new" do
    get new_exercice_url
    assert_response :success
  end

  test "should create exercice" do
    assert_difference('Exercice.count') do
      post exercices_url, params: { exercice: { annonce1: @exercice.annonce1, annonce2: @exercice.annonce2, annonce3: @exercice.annonce3, champ1: @exercice.champ1, champ2: @exercice.champ2, champ3: @exercice.champ3, champ4: @exercice.champ4, champ5: @exercice.champ5, champ6: @exercice.champ6, champ7: @exercice.champ7, champ8: @exercice.champ8, champ9: @exercice.champ9, content: @exercice.content, course_id: @exercice.course_id, slug: @exercice.slug, title: @exercice.title, user_id: @exercice.user_id } }
    end

    assert_redirected_to exercice_url(Exercice.last)
  end

  test "should show exercice" do
    get exercice_url(@exercice)
    assert_response :success
  end

  test "should get edit" do
    get edit_exercice_url(@exercice)
    assert_response :success
  end

  test "should update exercice" do
    patch exercice_url(@exercice), params: { exercice: { annonce1: @exercice.annonce1, annonce2: @exercice.annonce2, annonce3: @exercice.annonce3, champ1: @exercice.champ1, champ2: @exercice.champ2, champ3: @exercice.champ3, champ4: @exercice.champ4, champ5: @exercice.champ5, champ6: @exercice.champ6, champ7: @exercice.champ7, champ8: @exercice.champ8, champ9: @exercice.champ9, content: @exercice.content, course_id: @exercice.course_id, slug: @exercice.slug, title: @exercice.title, user_id: @exercice.user_id } }
    assert_redirected_to exercice_url(@exercice)
  end

  test "should destroy exercice" do
    assert_difference('Exercice.count', -1) do
      delete exercice_url(@exercice)
    end

    assert_redirected_to exercices_url
  end
end
