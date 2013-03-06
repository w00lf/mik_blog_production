require 'spec_helper'

describe Admin::PostsController do

  describe "INDEX action" do
    login_admin

    it "it returns post objects" do
      post = FactoryGirl.create(:post)
      get :index
      assigns(:posts).should eq([post])
    end

    it "it should render index template" do
      get :index
      response.should render_template :index
    end
  end

  describe "POST create" do
      login_admin
      context "with valid attributes" do
        it "creates a new post" do
            expect{
                post :create, post: FactoryGirl.attributes_for(:post)
            }.to change(Post,:count).by(1)
        end

        it "redirects to the new post" do
            post :create, post: FactoryGirl.attributes_for(:post)
            response.should redirect_to Post.last
        end
      end

      context "with invalid atributes" do
        it "does not save" do
          expect{
            post :create, post: FactoryGirl.attributes_for(:invalid_post)
          }.to_not change(Post,:count)
        end

        it 'rerenders new template' do
          post :create, post: FactoryGirl.attributes_for(:invalid_post)
          response.should render_template :new
        end
      end
  end

  describe "PUT methods" do
    login_admin

    before(:each) do
      @title = 'some title'
      @content = 'some content for you too'
      @post = FactoryGirl.create(:post, title: @title, content: @content)
    end

    context "with the valid attributes" do
      it "should find the right post" do
        put :edit, id: @post, post: FactoryGirl.attributes_for(:post)
        assigns(:post).should eq(@post)
      end

      it "changes attributes" do
        new_title = 'something new title'
        new_content = 'absolutly bew content'
        put :update, id: @post, post: FactoryGirl.attributes_for(:post, title: new_title, content: new_content)
        @post.reload
        @post.title.should eq(new_title)
        @post.content.should eq(new_content)
      end

      it "should redirect to updated post" do
        put :update, id: @post, post: FactoryGirl.attributes_for(:post)
        response.should redirect_to @post
      end
    end

    context "with invalid attributes" do
      it "doesn not changes attributes" do
        new_title = 'something new title'
        new_content = ''
        put :update, id: @post, post: FactoryGirl.attributes_for(:post, title: new_title, content: new_content)
        @post.reload
        @post.title.should_not eq(new_title)
        @post.content.should eq(@content)
      end

      it "should rerender edit template" do
        put :update, id: @post, post: FactoryGirl.attributes_for(:invalid_post)
        response.should render_template :edit
      end
    end
  end

  describe "DELETE destroy" do
    login_admin
    
    before(:each) do
      @post = FactoryGirl.create(:post)
    end

    it "should destroy the entry" do
      expect{ 
        delete :destroy, id: @post
      }.to change(Post,:count)
    end

    it "should redirect to blog index" do
      delete :destroy, id: @post
      response.should redirect_to :root
    end
  end


end