require 'test_helper'

class HomeWorksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @home_work = home_works(:one)
  end

  test "should get index" do
    get home_works_url
    assert_response :success
  end

  test "should get new" do
    get new_home_work_url
    assert_response :success
  end

  test "should create home_work" do
    assert_difference('HomeWork.count') do
      post home_works_url, params: { home_work: { check_point: @home_work.check_point, comment: @home_work.comment, group_or_student: @home_work.group_or_student, teacher_id: @home_work.teacher_id } }
    end

    assert_redirected_to home_work_url(HomeWork.last)
  end

  test "should show home_work" do
    get home_work_url(@home_work)
    assert_response :success
  end

  test "should get edit" do
    get edit_home_work_url(@home_work)
    assert_response :success
  end

  test "should update home_work" do
    patch home_work_url(@home_work), params: { home_work: { check_point: @home_work.check_point, comment: @home_work.comment, group_or_student: @home_work.group_or_student, teacher_id: @home_work.teacher_id } }
    assert_redirected_to home_work_url(@home_work)
  end

  test "should destroy home_work" do
    assert_difference('HomeWork.count', -1) do
      delete home_work_url(@home_work)
    end

    assert_redirected_to home_works_url
  end
end
