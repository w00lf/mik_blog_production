module ApplicationHelper
  include ReCaptcha::ViewHelper
  

  def display_user_info user_id = ''
    if user_id
      User.find(user_id).username
    else
      t(:default_user)
    end
  end

  def current_user_admin?
    if current_user != nil
      current_user.admin?
    else
      false
    end
  end

  def get_all_tags
    Post.tag_counts_on(:postTag)
  end

  def resource_class
    User #Для устранения ошибки devise
  end

  # Старый хелпер, не используется, есть палгин truncate_html
  def get_post_prewiew post, more_text
    post_content = post.content
    result_post = ''
    if(!(post_content.length > 1000) && (post_content =~ /<!--more-->/) != nil)    
      position = (post_content =~ /<!--more-->/)
      result_post = post_content.slice(0, position - 1)
    else
      result_post = truncate(post_content, :length => 1000, :separator => ' ') 
      result_post = truncate_to_last_tag(result_post)
    end
    link_more = link_to(post, :class => 'btn btn-small') { more_text }
    result_post + link_more
  end

  def last_comments number
    comments = Comment.order('created_at DESC').limit(number)
    comments = comments.each do |comment| 
      content = comment.content.gsub(%r{</?[^>]+?>}, '')
      comment.content = truncate(content, :length => 75, :separator => ' ', :omission => '...') 
    end
    comments
  end

  def devise_error_messages
    return "" if resource.errors.empty?

    messages = resource.errors.full_messages.map { |msg| content_tag(:li, msg) }.join
    flash[:alert] = raw(messages)
  end

end
