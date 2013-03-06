require 'spec_helper'

describe PostsController do
    
    describe "GET #show" do
        before(:each) do 
            @post ||= FactoryGirl.create(:post)
            get :show, id: @post
        end
        
        it "it renders post object" do
            assigns(:post).should eq(@post)
        end

        it "renders the :show view" do
            response.should render_template :show
        end
    end
end