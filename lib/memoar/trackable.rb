module Memoar
  module Tracker
    def self.included(base)
      base.extend ClassMethods
      base.class_eval do
        serialize :version_log, Array
        before_update :track_version_change
      end
    end

    def track_version_change
      self.version_log ||= []
      changeset = previous_changes.slice(*self.class.versioned_fields.map(&:to_s))
      return if changeset.empty?

      self.version_log << {
        at: DateTime.current,
        by: Memoar.current_user_id,
        changes: changeset
      }
    end

    def rollback_to(index)
      version = version_log[index]
      return unless version

      version[:changes].each do |field, (old_val, _)|
        self[field] = old_val
      end
      save!
    end

    module ClassMethods
      attr_reader :versioned_fields

      def track_changes_to(*fields)
        @versioned_fields = fields
        include Memoar::Tracker
      end
    end
  end
end

ActiveSupport.on_load(:active_record) do
  extend Memoar::Tracker::ClassMethods
end
