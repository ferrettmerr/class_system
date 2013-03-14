require 'test_helper'

class UniClassesControllerTest < ActionController::TestCase
  setup do
    @uni_class = uni_classes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:uni_classes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create uni_class" do
    assert_difference('UniClass.count') do
      post :create, uni_class: { code: @uni_class.code, instructor: @uni_class.instructor, room: @uni_class.room, schedule: @uni_class.schedule, subject: @uni_class.subject, title: @uni_class.title }
    end

    assert_redirected_to uni_class_path(assigns(:uni_class))
  end

  test "should show uni_class" do
    get :show, id: @uni_class
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @uni_class
    assert_response :success
  end

  test "should update uni_class" do
    put :update, id: @uni_class, uni_class: { code: @uni_class.code, instructor: @uni_class.instructor, room: @uni_class.room, schedule: @uni_class.schedule, subject: @uni_class.subject, title: @uni_class.title }
    assert_redirected_to uni_class_path(assigns(:uni_class))
  end

  test "should destroy uni_class" do
    assert_difference('UniClass.count', -1) do
      delete :destroy, id: @uni_class
    end

    assert_redirected_to uni_classes_path
  end
end
