
desc 'updates stau'
task :update_status => :environment do
  issues = Issue.all

  issues.each do |issue|
    issue.current_status
  end
end


desc 'write issue'
task :write_issue => :environment do
  Issue.create(:title => "cron issue", :description => "cron created me")
end