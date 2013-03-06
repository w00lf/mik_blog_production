require 'spec_helper'

describe CommentsController do
    
    describe "POST #create" do
    	login_user
        before(:each) do 	
            @post ||= FactoryGirl.create(:post)
        end
        
        it "it creates new comment if valid attributes" do
        	expect{
                post :create, post_id: @post.id, :comment => { :content => 'MyText' }
            }.to change(Comment,:count).by(1)
        	
            #assigns(:post).should eq(@post)
        end

        it "doesnot creates new comment with invalid attributes" do
            expect{
                post :create, post_id: @post.id, :comment => { :content => '' }
            }.to_not change(Comment,:count).by(1)
        end
    end
end
  