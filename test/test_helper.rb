# frozen_string_literal: true

ENV["RAILS_ENV"] = "test"
require "logger"
require "rails/all"
require "minitest/autorun"
require_relative "../lib/memoar"

ActiveRecord::Base.establish_connection(adapter: "sqlite3", database: ":memory:")

ActiveRecord::Schema.define do
  create_table :users, force: true do |t|
    t.string  :name
    t.string  :email
    t.integer :age
    t.json :version_log, default: []
    t.timestamps
  end
end

class User < ActiveRecord::Base
  track_changes_to :name, :email, limit: 2
end