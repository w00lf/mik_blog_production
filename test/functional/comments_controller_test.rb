require 'test_helper'

class CommentsControllerTest < ActionController::TestCase
  include Devise::TestHelpers
  
  setup do
    @post = posts(:one)
  end

  #test "should get index" do
    #get :index ,:post_id=> @post

   # assert_response :success

    #assert_not_nil assigns(:domains)
  #end

  test "should create comments" do    
    login_as_casual_user
    
    assert_difference('Comment.count') do
      post :create, :post_id => @post, :comment => { :content => 'MyText' }
    end
  end

end
