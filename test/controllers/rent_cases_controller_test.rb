require 'test_helper'

class RentCasesControllerTest < ActionController::TestCase
  setup do
    @rent_case = rent_cases(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rent_cases)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create rent_case" do
    assert_difference('RentCase.count') do
      post :create, rent_case: {  }
    end

    assert_redirected_to user_rent_case_path(assigns(:rent_case))
  end

  test "should show rent_case" do
    get :show, id: @rent_case
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @rent_case
    assert_response :success
  end

  test "should update rent_case" do
    patch :update, id: @rent_case, rent_case: {  }
    assert_redirected_to user_rent_case_path(assigns(:rent_case))
  end

  test "should destroy rent_case" do
    assert_difference('RentCase.count', -1) do
      delete :destroy, id: @rent_case
    end

    assert_redirected_to rent_cases_path
  end
end
