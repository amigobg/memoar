# frozen_string_literal: true

require_relative "memoar/version"

module Memoar
  class Error < StandardError; end
  
  mattr_accessor :current_user_id
end
