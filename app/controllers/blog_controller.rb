class BlogController < ApplicationController
  def index
    if user_signed_in?
      if current_user.admin
        @posts = Post.paginate(:page => params[:page], :per_page => 10).by_date
      else
        @posts = Post.published(true).paginate(:page => params[:page], :per_page => 10).by_date
      end
    else
      @posts = Post.published(true).paginate(:page => params[:page], :per_page => 10).by_date
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @posts }
    end
  end
  def listing_tag
    @tag = params[:tag]
    @tagged_posts = Post.published(true).tagged_with(params[:tag]).order('created_at DESC').paginate(:page => params[:page], :per_page => 10)
  end

  def search
    @search_word = params[:word]
    @search_result = Post.where("content LIKE ? and published=?", '%' + @search_word + '%', true)
    if @search_result
      @result =  @search_result.paginate(:page => params[:page], :per_page => 10)
    else
      @result = []
    end
  end
end
