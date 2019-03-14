require 'active_record'
require 'rake_migration'
require 'rake_migrations/config'

module RakeMigrations

  def self.configure
    yield @config = RakeMigrations::Config.new
  end

  def self.check

    # database_config_hash = DATABASE_CONFIG[Rails.env]

    # database_name = RakeMigrationsCheck.configuration.database_name
    # hostname = RakeMigrationsCheck.configuration.hostname

    # client = PG.connect(host: hostname,
    #                     dbname: database_name)
    #

    client = @config.generate_database_client

    results = client.exec("select * from rake_migrations").map {|res| res["version"] }
    rake_migrations_lib = "#{`pwd`.strip}/lib/tasks/rake_migrations/*"

    rake_files = Dir[rake_migrations_lib].sort.map do |file|
      rake_id = RakeMigration.version_from_path(file)

      if !results.include?(rake_id)
        file = File.read(file)
        namespace = file[/namespace :?([^: ,]*)/m, 1].strip
        task = file[/task :?([^ :,]*)/m, 1]
        "rake #{namespace}:#{task} # #{rake_id}"
      end
    end.compact

    if !rake_files.empty?
      puts "\n"
      puts "You need to run the following rakes:"
      puts "------------------------------------"
      rake_files.each { |file| puts "\e[31m#{file}\e[0m" }
      puts "\n"
    end

  end

end
