require "rails/generators/active_record"

module Memoar
  module Generators
    class InstallGenerator < ActiveRecord::Generators::Base
      source_root File.expand_path("templates", __dir__)

      def copy_migration
        migration_template "add_version_log_to_model.rb.erb", "db/migrate/add_version_log_to_#{file_name}_rb"
      end

      private
        def file_name
          "#{table_name}"
        end
    end
  end
end
