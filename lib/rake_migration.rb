class RakeMigration < ::ActiveRecord::Base
  def self.version_from_path(path)
    path.split('/').last.split('_').first(2).join('_')
  end

  def self.findcreate_by_version(rake_id)
    find_or_create_by_version(rake_id)
  end

  def self.mark_complete(file)
    rake_id = version_from_path(file)
    if methods.include?(:find_or_create_by)
      find_or_create_by(version: rake_id)
    else
      findcreate_by_version(rake_id)
    end
  end

  def self.check_for_pending_tasks
    RakeMigrations.check
  end

end
