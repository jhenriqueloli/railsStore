require "application_system_test_case"

class EssencesTest < ApplicationSystemTestCase
  setup do
    @essence = essences(:one)
  end

  test "visiting the index" do
    visit essences_url
    assert_selector "h1", text: "Essences"
  end

  test "creating a Essence" do
    visit essences_url
    click_on "New Essence"

    click_on "Create Essence"

    assert_text "Essence was successfully created"
    click_on "Back"
  end

  test "updating a Essence" do
    visit essences_url
    click_on "Edit", match: :first

    click_on "Update Essence"

    assert_text "Essence was successfully updated"
    click_on "Back"
  end

  test "destroying a Essence" do
    visit essences_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Essence was successfully destroyed"
  end
end
