require "application_system_test_case"

class HomeWorksTest < ApplicationSystemTestCase
  setup do
    @home_work = home_works(:one)
  end

  test "visiting the index" do
    visit home_works_url
    assert_selector "h1", text: "Home Works"
  end

  test "creating a Home work" do
    visit home_works_url
    click_on "New Home Work"

    fill_in "Check Point", with: @home_work.check_point
    fill_in "Comment", with: @home_work.comment
    fill_in "Group Or Student", with: @home_work.group_or_student
    fill_in "Teacher", with: @home_work.teacher_id
    click_on "Create Home work"

    assert_text "Home work was successfully created"
    click_on "Back"
  end

  test "updating a Home work" do
    visit home_works_url
    click_on "Edit", match: :first

    fill_in "Check Point", with: @home_work.check_point
    fill_in "Comment", with: @home_work.comment
    fill_in "Group Or Student", with: @home_work.group_or_student
    fill_in "Teacher", with: @home_work.teacher_id
    click_on "Update Home work"

    assert_text "Home work was successfully updated"
    click_on "Back"
  end

  test "destroying a Home work" do
    visit home_works_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Home work was successfully destroyed"
  end
end
