require 'test_helper'

class ArticleTest < ActiveSupport::TestCase

  setup do 
    @data = { :name => 'name', 
              :title => 'article_w_name', 
              :content => 'article_w_title fsdfsd' }
    @data_1 = { :name => 'name', 
              :title => 'diefferent title', 
              :content => 'diefferent content' }
  end

  test "Should save valid article" do
    article = Article.new(@data)
    assert article.save
  end

  test "Should not save empty article" do
  	article = Article.new
    assert !article.save
  end

  test "Should not save article without title" do
  	article = Article.new(:name => @data[:name], :content => @data[:content])
    assert !article.save
  end

  test 'should not save article without name' do
    article = Article.new(:title => @data[:title], :content => @data[:content])
    assert !article.save
  end
  	
  test 'should not save article without content!' do
  	article = Article.new(:name => @data[:name], :title => @data[:title])
    assert !article.save
  end

  test 'Should not saved article with identical names' do
  	article_normal = Article.new(:name => @data[:name], :title => @data[:title], :content => @data[:content])
  	article_normal_same_name = Article.new(:name =>  @data_1[:name], :title =>  @data_1[:title], :content =>  @data_1[:title])

    assert_not_equal article_normal.save, article_normal_same_name.save
  end
end
