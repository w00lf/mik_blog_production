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
    @tagged_posts = Post.tagged_with(params[:tag]).order('created_at DESC').paginate(:page => params[:page], :per_page => 10).select {|entry| entry.published }
    if @tagged_posts.count > 0
      @notice = t('blog.tag.results_html', :tag=>@tag )
    else
      @notice = t('blog.tag.no_result_html', :tag=>@tag )
    end
  end

  def search
    @search_word = params[:word]
    @result = Post.search(:content=> @search_word).select {|entry| entry.published }
    if @result.count > 0
      @notice = t('blog.search.results_html', :word=>@search_word )
    else
      @notice = t('blog.search.no_result_html', :word=>@search_word )
    end
  end
end
