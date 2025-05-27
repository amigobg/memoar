# frozen_string_literal: true

require "memoar/version"
require "memoar/tracker"

module Memoar
  class Error < StandardError; end
end

ActiveSupport.on_load(:active_record) do
  include Memoar::Tracker
end