require "rails/generators/active_record"

module Memoar
  module Generators
    class InstallGenerator < ActiveRecord::Generators::Base
      source_root File.expand_path("templates", __dir__)

      def copy_migration
        migration_template "add_version_log_to_model.rb.erb", "db/migrate/add_version_log_to_#{table_name}.rb"
      end

      private
        def timestamp
          Time.now.utc.strftime("%Y%m%d%H%M%S")
        end
    end
  end
end