require 'spec_helper'

describe Issue do
  describe "show page: GET /issues/:id" do
    let(:issue){Issue.create(:title => "Test")}

    it "displays the status of an issue" do
      visit issue_path(issue)
      page.should have_content("Status")
    end
  end

  describe "edit page: GET /issues/:id/edit" do
    let(:issue){Issue.create(:title => "Test")}

    it "displays the options for status with checkboxes" do
      visit edit_issue_path(issue)

      # save_and_open_page

      page.should have_content("Open")
      page.should have_content("Closed")
    end
  end



end
