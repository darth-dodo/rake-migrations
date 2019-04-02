class CreateRakeMigrationsTable < ActiveRecord::Migration
  def self.up
    create_table :rake_migrations, id: false do |t|
      t.string :version
    end
  end

  def self.down
    drop_table :rake_migrations
  end
end
