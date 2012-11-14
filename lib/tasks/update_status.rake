
desc 'updates status'
task :update_status => :environment do
  issues = Issue.all

  issues.each do |issue|
    issue.current_status
    issue.save
    puts issue.title
    puts issue.aasm_state
  end
end


desc 'write issue'
task :write_issue => :environment do
  user = User.last
  issue = user.issues.create(:title => "cron issue", :description => "cron created me")
  issue.resolve
end