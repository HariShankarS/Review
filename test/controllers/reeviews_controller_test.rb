require 'test_helper'

class ReeviewsControllerTest < ActionController::TestCase
  setup do
    @reeview = reeviews(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:reeviews)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create reeview" do
    assert_difference('Reeview.count') do
      post :create, reeview: { comment: @reeview.comment, rating: @reeview.rating }
    end

    assert_redirected_to reeview_path(assigns(:reeview))
  end

  test "should show reeview" do
    get :show, id: @reeview
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @reeview
    assert_response :success
  end

  test "should update reeview" do
    patch :update, id: @reeview, reeview: { comment: @reeview.comment, rating: @reeview.rating }
    assert_redirected_to reeview_path(assigns(:reeview))
  end

  test "should destroy reeview" do
    assert_difference('Reeview.count', -1) do
      delete :destroy, id: @reeview
    end

    assert_redirected_to reeviews_path
  end
end
