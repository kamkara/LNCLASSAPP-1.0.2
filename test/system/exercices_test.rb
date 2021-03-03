require "application_system_test_case"

class ExercicesTest < ApplicationSystemTestCase
  setup do
    @exercice = exercices(:one)
  end

  test "visiting the index" do
    visit exercices_url
    assert_selector "h1", text: "Exercices"
  end

  test "creating a Exercice" do
    visit exercices_url
    click_on "New Exercice"

    fill_in "Annonce1", with: @exercice.annonce1
    fill_in "Annonce2", with: @exercice.annonce2
    fill_in "Annonce3", with: @exercice.annonce3
    fill_in "Champ1", with: @exercice.champ1
    fill_in "Champ2", with: @exercice.champ2
    fill_in "Champ3", with: @exercice.champ3
    fill_in "Champ4", with: @exercice.champ4
    fill_in "Champ5", with: @exercice.champ5
    fill_in "Champ6", with: @exercice.champ6
    fill_in "Champ7", with: @exercice.champ7
    fill_in "Champ8", with: @exercice.champ8
    fill_in "Champ9", with: @exercice.champ9
    fill_in "Content", with: @exercice.content
    fill_in "Course", with: @exercice.course_id
    fill_in "Slug", with: @exercice.slug
    fill_in "Title", with: @exercice.title
    fill_in "User", with: @exercice.user_id
    click_on "Create Exercice"

    assert_text "Exercice was successfully created"
    click_on "Back"
  end

  test "updating a Exercice" do
    visit exercices_url
    click_on "Edit", match: :first

    fill_in "Annonce1", with: @exercice.annonce1
    fill_in "Annonce2", with: @exercice.annonce2
    fill_in "Annonce3", with: @exercice.annonce3
    fill_in "Champ1", with: @exercice.champ1
    fill_in "Champ2", with: @exercice.champ2
    fill_in "Champ3", with: @exercice.champ3
    fill_in "Champ4", with: @exercice.champ4
    fill_in "Champ5", with: @exercice.champ5
    fill_in "Champ6", with: @exercice.champ6
    fill_in "Champ7", with: @exercice.champ7
    fill_in "Champ8", with: @exercice.champ8
    fill_in "Champ9", with: @exercice.champ9
    fill_in "Content", with: @exercice.content
    fill_in "Course", with: @exercice.course_id
    fill_in "Slug", with: @exercice.slug
    fill_in "Title", with: @exercice.title
    fill_in "User", with: @exercice.user_id
    click_on "Update Exercice"

    assert_text "Exercice was successfully updated"
    click_on "Back"
  end

  test "destroying a Exercice" do
    visit exercices_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Exercice was successfully destroyed"
  end
end
