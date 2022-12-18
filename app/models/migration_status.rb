class MigrationStatus
  attr_reader :migrator

  def initialize(migrator = ActiveRecord::Base.connection.migration_context.open)
    @migrator = migrator
  end

  def pending_migrations
    migrator.pending_migrations.map do |migration|
      "#{migration.name} - #{migration.version}"
    end
  end
end
