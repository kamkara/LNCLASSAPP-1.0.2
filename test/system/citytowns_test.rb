require "application_system_test_case"

class CitytownsTest < ApplicationSystemTestCase
  setup do
    @citytown = citytowns(:one)
  end

  test "visiting the index" do
    visit citytowns_url
    assert_selector "h1", text: "Citytowns"
  end

  test "creating a Citytown" do
    visit citytowns_url
    click_on "New Citytown"

    fill_in "Slug", with: @citytown.slug
    fill_in "Title", with: @citytown.title
    fill_in "User", with: @citytown.user_id
    click_on "Create Citytown"

    assert_text "Citytown was successfully created"
    click_on "Back"
  end

  test "updating a Citytown" do
    visit citytowns_url
    click_on "Edit", match: :first

    fill_in "Slug", with: @citytown.slug
    fill_in "Title", with: @citytown.title
    fill_in "User", with: @citytown.user_id
    click_on "Update Citytown"

    assert_text "Citytown was successfully updated"
    click_on "Back"
  end

  test "destroying a Citytown" do
    visit citytowns_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Citytown was successfully destroyed"
  end
end
