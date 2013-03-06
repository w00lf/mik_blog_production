require 'spec_helper'

describe BlogController do
    
    describe "GET #search" do
        before(:each) do #Загрузить ТАБЛИЦЫ В ТЕСТОВУЮ БД!
            @post ||= FactoryGirl.create(:post)
            @search_sentence = @post.content.split(' ')[1]
            get :search, word: @search_sentence
        end
      
        it "it renders post object for search word" do
            assigns(:result).should include(@post)
        end

        it "renders the :show view" do
            response.should render_template :search
        end
    end

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
end