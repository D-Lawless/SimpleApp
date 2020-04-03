require "application_system_test_case"

class EventpostsTest < ApplicationSystemTestCase
  setup do
    @eventpost = eventposts(:one)
  end

  test "visiting the index" do
    visit eventposts_url
    assert_selector "h1", text: "Eventposts"
  end

  test "creating a Eventpost" do
    visit eventposts_url
    click_on "New Eventpost"

    fill_in "Post", with: @eventpost.post
    click_on "Create Eventpost"

    assert_text "Eventpost was successfully created"
    click_on "Back"
  end

  test "updating a Eventpost" do
    visit eventposts_url
    click_on "Edit", match: :first

    fill_in "Post", with: @eventpost.post
    click_on "Update Eventpost"

    assert_text "Eventpost was successfully updated"
    click_on "Back"
  end

  test "destroying a Eventpost" do
    visit eventposts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Eventpost was successfully destroyed"
  end
end
