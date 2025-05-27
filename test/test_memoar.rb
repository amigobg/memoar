# frozen_string_literal: true

require "test_helper"

class TestMemoar < Minitest::Test
  def setup
    User.create(name: "John Doe", email: "john@example.com", age: 18)
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
    assert_equal("john@example.com", @user.email)
    assert_equal(18, @user.age)
    assert_equal(1, versions.size)
    
    version = versions.first
    assert_equal({"name" => ["John Doe", "Jane Doe"]}, version["changes"])
    
    @user.update!(email: "jane@example.com")
    versions = @user.previous_versions
    assert_equal("Jane Doe", @user.name)
    assert_equal("jane@example.com", @user.email)
    assert_equal(18, @user.age)
    assert_equal(2, versions.size)
    
    version = versions.last
    assert_equal({"email" => ["john@example.com", "jane@example.com"]}, version["changes"])
    
    @user.update!(age: 21)
    assert_equal("Jane Doe", @user.name)
    assert_equal("jane@example.com", @user.email)
    assert_equal(21, @user.age)
    versions = @user.previous_versions
    assert_equal(2, versions.size)
  end
end