require "#{Rails.root.to_s}/lib/tasks/rake_migrations_check"

namespace :devops_rake_utils do
  desc "Lists out all the non migrated rake tasks for an application"
  task list_pending_rake_tasks: [:environment] do
    RakeMigrationsCheck.check
  end
end
