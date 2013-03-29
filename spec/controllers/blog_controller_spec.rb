require 'spec_helper'

describe BlogController do

    describe "GET #listing_tag" do
        before(:each) do 
            @post ||= FactoryGirl.create(:post)
            #@post = FactoryGirl.build(:post, :postTag_list => 'foo, bar')
            @tag = @post.postTag_list.split(',')[0]
            get :listing_tag, tag: @tag
        end
      
        it "it renders post object for tag" do
            assigns(:tagged_posts).should include(@post)
        end

        it "renders the :listing_tag view" do
            response.should render_template :listing_tag
        end
    end

    describe "GET #search" do
        before(:each) do 
            @post ||= FactoryGirl.create(:post)
            @search_word = @post.content.split(' ').first
            get :search, word: @search_word
        end
      
        it "it renders post object for search" do
            assigns(:result).should include(@post)
        end

        it "renders the :search view" do
            response.should render_template :search
        end
    end
end