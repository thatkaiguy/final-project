desc "This task is called by the Heroku scheduler add-on"

task :reset_database => :environment do
  Rake::Task["db:drop"].invoke
  Rake::Task["db:setup"].invoke
end
