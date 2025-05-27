# frozen_string_literal: true

require "test_helper"

class TestMemoar < Minitest::Test
  def setup
    User.create(name: "John Doe", email: "john@example.com")
    @user = User.last
  end

  def test_tracks_changes_to_user_fields
    refute_nil ::Memoar::VERSION
    assert_equal(["name", "email"], User.version_tracked_fields)
    versions = @user.previous_versions
    assert_equal(0, versions.size)
    assert_equal("John Doe", @user.name)

    @user.update!(name: "Jane Doe")
    versions = @user.previous_versions
    assert_equal("Jane Doe", @user.name)
    assert_equal(1, versions.size)
    
    version = versions.first
    assert_equal({"name" => ["John Doe", "Jane Doe"]}, version["changes"])
  end
end