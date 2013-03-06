require 'spec_helper'

describe Article do
  it "has a valid factory" do
  	FactoryGirl.create(:article).should be_valid
  end

  context "\n validations tests:" do 
    it "is invalid without a title" do
    	FactoryGirl.build(:article, title: nil).should_not be_valid
    end
    it "is invalid without a content" do
    	FactoryGirl.build(:article, content: nil).should_not be_valid
    end
    it "is invalid without a name" do
      FactoryGirl.build(:article, name: nil).should_not be_valid
    end
  end

  it "it doesnt save the same name" do
    FactoryGirl.create(:article, name: 'somename')
    FactoryGirl.build(:article, name: 'somename').should_not be_valid
  end
end