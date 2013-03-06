require 'spec_helper'

describe Comment do
  it "has a valid factory" do
  	@post = FactoryGirl.create(:post)
    FactoryGirl.create(:comment, post_id: @post.id).should be_valid
  end

  it "is invalid without a content" do
  	FactoryGirl.build(:comment, content: nil).should_not be_valid
  end
end