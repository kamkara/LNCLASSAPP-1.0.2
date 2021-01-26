require "application_system_test_case"

class HelpsTest < ApplicationSystemTestCase
  setup do
    @help = helps(:one)
  end

  test "visiting the index" do
    visit helps_url
    assert_selector "h1", text: "Helps"
  end

  test "creating a Help" do
    visit helps_url
    click_on "New Help"

    fill_in "Author", with: @help.author
    fill_in "Content", with: @help.content
    fill_in "Material", with: @help.material_id
    fill_in "Title", with: @help.title
    fill_in "User", with: @help.user_id
    click_on "Create Help"

    assert_text "Help was successfully created"
    click_on "Back"
  end

  test "updating a Help" do
    visit helps_url
    click_on "Edit", match: :first

    fill_in "Author", with: @help.author
    fill_in "Content", with: @help.content
    fill_in "Material", with: @help.material_id
    fill_in "Title", with: @help.title
    fill_in "User", with: @help.user_id
    click_on "Update Help"

    assert_text "Help was successfully updated"
    click_on "Back"
  end

  test "destroying a Help" do
    visit helps_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Help was successfully destroyed"
  end
end
