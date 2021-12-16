require "application_system_test_case"

class VapesTest < ApplicationSystemTestCase
  setup do
    @vape = vapes(:one)
  end

  test "visiting the index" do
    visit vapes_url
    assert_selector "h1", text: "Vapes"
  end

  test "creating a Vape" do
    visit vapes_url
    click_on "New Vape"

    click_on "Create Vape"

    assert_text "Vape was successfully created"
    click_on "Back"
  end

  test "updating a Vape" do
    visit vapes_url
    click_on "Edit", match: :first

    click_on "Update Vape"

    assert_text "Vape was successfully updated"
    click_on "Back"
  end

  test "destroying a Vape" do
    visit vapes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Vape was successfully destroyed"
  end
end
