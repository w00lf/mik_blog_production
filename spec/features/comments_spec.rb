require 'spec_helper'

describe 'Comments features', :type=>:feature do
  before(:each) do  
    capybara_login_user
    @post ||= FactoryGirl.create(:post)
    visit "/posts/#{@post.id}"
  end

  it "creates comments with ajax", js: true do
    comment = FactoryGirl.build(:comment)
    expect{
      within "#new_comment" do
        fill_in 'comment[content]', with: comment.content
        find("input[name='commit']").click()
      end
      sleep 1
    }.to change(Comment,:count).by(1)
    page.should have_content comment.content
    page.should have_content I18n::t(:content_save)
  end

  it "doesnot create empty comment" do
    expect {
      within "#new_comment" do
        find("input[name='commit']").click()
      end
    }.to_not change(Comment,:count).by(1)
    page.should have_content I18n::t('errors.messages.blank')
  end
end