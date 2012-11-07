require 'spec_helper'

describe Issue do
  it "have a status attribute" do
    issue = Issue.create(status:"open")
    issue.status.should be_true
  end

  it "default status should be 'open'" do
    issue = Issue.create(title:"issue 1")
    issue.status.should == "open"
  end

  it "should have status change to 'instructor needed' after 30 min" do
    issue = Issue.create
    Timecop.travel(Time.now + 30) do
      issue.current_status.should == "instructor needed"
    end
  end

  it "status should change to 'resolved' when an answer is accepted" do
    issue = Issue.create
    issue.comments.create(is_answer: true)
    issue.current_status.should == "resolved"
  end

end