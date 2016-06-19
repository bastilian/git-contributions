# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)
Rails.application.load_tasks

require 'yard'
YARD::Rake::YardocTask.new

require 'resque/tasks'

task 'resque:setup' => :environment do
  Resque.before_fork = Proc.new do |job|
    ActiveRecord::Base.connection.disconnect!
  end
  Resque.after_fork = Proc.new do |job|
    ActiveRecord::Base.establish_connection
  end
end
