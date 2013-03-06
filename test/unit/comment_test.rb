require 'test_helper'

class CommentTest < ActiveSupport::TestCase
 	setup do 
 		@post = posts(:one)
 	end 	

	test "Should create comment" do
		comment = Comment.new(:content => 'Some content')
		comment.post_id = @post
		assert comment.save
	end
end
