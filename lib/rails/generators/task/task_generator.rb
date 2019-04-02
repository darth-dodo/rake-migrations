class TaskGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('../templates', __FILE__)
  argument :actions, type: :array, default: [], banner: "action action"

  def create_task_files
    time_stamp = Time.now.strftime("%Y%m%d%H%M%S")
    random_char_str = SecureRandom.hex(3)
    template 'task.rb', File.join('lib/tasks/rake_migrations', "#{time_stamp}_#{random_char_str}_#{file_name}.rake")
  end
end
