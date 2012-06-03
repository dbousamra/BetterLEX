require 'test_helper'

class ReviewsControllerTest < ActionController::TestCase
  setup do
    @subject = subjects(:one)
    @review = reviews(:one)
  end

  test "should get index" do
    get :index, :subject_id => @subject
    assert_response :success
    assert_not_nil assigns(:reviews)
  end

  test "should get new" do
    get :new, :subject_id => @subject
    assert_response :success
  end

  test "should create review" do
    assert_difference('Review.count') do
      post :create, :subject_id => @subject, :review => @review.attributes
    end

    assert_redirected_to subject_review_path(@subject, assigns(:review))
  end

  test "should show review" do
    get :show, :subject_id => @subject, :id => @review.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :subject_id => @subject, :id => @review.to_param
    assert_response :success
  end

  test "should update review" do
    put :update, :subject_id => @subject, :id => @review.to_param, :review => @review.attributes
    assert_redirected_to subject_review_path(@subject, assigns(:review))
  end

  test "should destroy review" do
    assert_difference('Review.count', -1) do
      delete :destroy, :subject_id => @subject, :id => @review.to_param
    end

    assert_redirected_to subject_reviews_path(@subject)
  end
end
