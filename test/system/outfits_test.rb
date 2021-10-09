require "application_system_test_case"

class OutfitsTest < ApplicationSystemTestCase
  setup do
    @outfit = outfits(:one)
  end

  test "visiting the index" do
    visit outfits_url
    assert_selector "h1", text: "Outfits"
  end

  test "creating a Outfit" do
    visit outfits_url
    click_on "New Outfit"

    fill_in "Content", with: @outfit.content
    fill_in "Title", with: @outfit.title
    click_on "Create Outfit"

    assert_text "Outfit was successfully created"
    click_on "Back"
  end

  test "updating a Outfit" do
    visit outfits_url
    click_on "Edit", match: :first

    fill_in "Content", with: @outfit.content
    fill_in "Title", with: @outfit.title
    click_on "Update Outfit"

    assert_text "Outfit was successfully updated"
    click_on "Back"
  end

  test "destroying a Outfit" do
    visit outfits_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Outfit was successfully destroyed"
  end
end
