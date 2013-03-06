class CommentsController < ApplicationController
  # GET /comments
  # GET /comments.json
  load_and_authorize_resource

  skip_authorize_resource :only => [:show, :create, :new]

  # GET /comments/1
  # GET /comments/1.json
  def show
    @comment = Comment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @comment }
    end
  end

  # GET /comments/new
  # GET /comments/new.json
  def new
    @comment = Comment.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @comment }
    end
  end

  # GET /comments/1/edit
  def edit
    @comment = Comment.find(params[:id])
  end

  # POST /comments
  # POST /comments.json
  def create
    @post = Post.find(params[:post_id])
    @user = current_user.nil? ? nil : current_user.id
    comment_values = params[:comment]
    comment_values['user_id'] = @user

    @comment = escape_comment(comment_values)

    respond_to do |format|
      if check_recaptcha && @comment.save
        format.html { redirect_to post_path(@post) }
        format.js { @notice = t(:content_save) }
      else
        @errors = @comment.errors.full_messages.join('<br>')
        format.html { redirect_to post_path(@post), :alert => @errors}
        format.js
      end
    end 
  end

  # PUT /comments/1
  # PUT /comments/1.json
  #def update
    #TODO: Доделать апдейт коммента
    
  #  respond_to do |format|
  #    if @comment.update_attributes(comment_values)
  #      format.html { redirect_to @comment, notice: 'Comment was successfully updated.' }
  #      format.json { head :no_content }
  #    else
  #      format.html { render action: "edit" }
  #      format.json { render json: @comment.errors, status: :unprocessable_entity }
  #    end
  # end
  #end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to post_path(@post) }
      format.js { @notice = t(:content_destroied) }
    end
  end

  private
  def check_recaptcha
    if(@user === nil)
      captcha = validate_recap(params, @comment.errors)
    else 
      captcha = true
    end
  end

  def escape_comment comment_values
    comment_content = CGI::escapeHTML(comment_values['content'])
    custom_html_maker = CustomHtmlMaker.new
    parser = RbbCode::Parser.new(:html_maker => custom_html_maker)
    comment_values['content'] = parser.parse(comment_content)
    @post.comments.new(comment_values)
  end
end
