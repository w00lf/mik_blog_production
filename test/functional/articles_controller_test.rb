require 'test_helper'

class ArticlesControllerTest < ActionController::TestCase
  include Devise::TestHelpers
  
  setup do
    @article = articles(:one)
    @article_2 = articles(:two)
  end

  test "should show article on human readable URL" do
    get :show, article: @article.name
    assert_response :success
    assert_recognizes({:controller => 'articles', :action => 'show', :article => 'fooo'}, 'fooo')
  end
end
