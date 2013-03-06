class PostsController < ApplicationController
  load_and_authorize_resource

  # GET /posts/1
  # GET /posts/1.json
  def show
    @post = Post.find(params[:id])
    @comments = @post.comments.order('created_at DESC')
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @post }
    end
  end

end
