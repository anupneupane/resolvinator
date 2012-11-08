require 'spec_helper'


describe Comment do
  it "is able to comment on an issue" do
    issue = Issue.create(:title => "Why won't Joe let up?")
    issue.comments.create(:content => "This is a test comment")


    issue.comments.first.title should == "Why won't Joe let up?"
  end
end


