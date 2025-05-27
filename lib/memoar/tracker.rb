# frozen_string_literal: true

require 'active_support/concern'
require 'json'

module Memoar
  module Tracker
    extend ActiveSupport::Concern

    included do
      after_update :track_changes
    end

    def previous_versions
      raw = self[:version_log].presence || '[]'
      JSON.parse(raw)
    rescue JSON::ParserError
      []
    end

    private
      def track_changes
        tracked = self.class.version_tracked_fields
        changeset = previous_changes.slice(*tracked)

        return if changeset.empty?

        version_entry = {
          changed_at: Time.current.utc.iso8601,
          changes: changeset
        }
        
        history = previous_versions
        history << version_entry
        history = history.last(self.class.version_log_limit)

        self[:version_log] = history.to_json
        update_column(:version_log, self[:version_log])
      end

      class_methods do
        def track_changes_to(*fields, limit: 50)
          @version_tracked_fields = fields.map(&:to_s)
          @version_log_limit = limit
        end

        def version_tracked_fields
          @version_tracked_fields || []
        end

        def version_log_limit
          @version_log_limit || 50
        end
      end
  end
end