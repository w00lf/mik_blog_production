require 'test_helper'
require_relative 'admin_setup.rb'

class Admin::PostsControllerTest < Admin::AdminTests
  include Devise::TestHelpers
  
  setup do
    @post = posts(:one)
  end

  test "casual user cant edit posts" do
    login_as_casual_user()

    get :edit, id: @post
    assert_response :redirect
  
    put :update, id: @post, post: { :title => 'fooo', :content => 'new content' }

    assert_not_same @post.title, 'fooo'
  end

  test "casual user cant create posts" do
    login_as_casual_user()

    get :new
    assert_response :redirect

    assert_no_difference('Post.count') do 
      post :create, post: @post.attributes
    end  
  end

  test "casual user cant destroy post" do
    login_as_casual_user()

    assert_no_difference('Post.count', -1) do
      delete :destroy, id: @post
    end
    assert_response :redirect
  end

  test "admin can create post" do
    login_as_admin()

    get :new
    assert_response :success

    assert_difference('Post.count') do
      post :create, post: {:title => 'fooo', :published => true, :content => 'loong words for tests'}
    end

    assert_redirected_to post_path(assigns(:post))
  end

  test "admin can update post" do
    login_as_admin()

    get :edit, id: @post
    assert_response :success

    put :update, id: @post, post: {:title => 'fooo', :published => true, :content => 'loong words for tests'}
    assert_redirected_to post_path(assigns(:post))
  end

  test "admin can destroy post" do
    login_as_admin()

    assert_difference('Post.count', -1) do
      delete :destroy, id: @post
    end
    assert_redirected_to :root
  end

end
