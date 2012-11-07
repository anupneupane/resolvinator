require 'spec_helper'

describe IssuesController do

  describe 'POST /issues' do
    it 'should create an issue' do
      post :create, {issue: {title:"Issue 1", description:"some text 1"}}
      assigns(:issue).should be_true
    end
  end
end