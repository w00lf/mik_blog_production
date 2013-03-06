require 'test_helper'

class PostTest < ActiveSupport::TestCase
  setup do 
    @data = { 
              :title => 'post_w_name', 
              :content => 'post_w_title fsdfsd' }
  end

  test "Should bot save emty post" do
  	post = Post.new
    assert !post.save
  end

  test "Should bot save post without title" do
  	post = Post.new(:content => @data[:content])
    assert !post.save
  end

  	
  test 'should not save post without content!' do
  	post = Post.new(:title => @data[:title])
    assert !post.save
  end

end
