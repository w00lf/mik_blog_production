class ArticlesController < ApplicationController
  # GET /articles
  # GET /articles.json

  def show
    @article = Article.find(params[:article])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @article }
    end
  end

end
