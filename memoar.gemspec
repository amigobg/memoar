# frozen_string_literal: true

require_relative "lib/memoar/version"

Gem::Specification.new do |spec|
  spec.name = "memoar"
  spec.version = Memoar::VERSION
  spec.authors = ["Stoyan Nikolov"]
  spec.email = ["s.nikolov@roomspilot.com"]

  spec.summary = "A simple versioning gem for ActiveRecord models using a JSON column."
  spec.description = "Memoar tracks changes on specified model fields and stores them in a JSON column."

  spec.homepage = "https://github.com/amigobg/memoar"
  spec.metadata = {
    "source_code_uri" => "https://github.com/amigobg/memoar",
    "changelog_uri"   => "https://github.com/amigobg/memoar/blob/main/CHANGELOG.md"
  }

  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.0.0"

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir[
      "lib/**/*.rb",
      "README.md",
      "LICENSE*",
      "Rakefile",
      "test/**/*.rb"
    ]
  end
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "rails", "~> 6.0"
  spec.add_development_dependency "sqlite3", "~> 1.4"
  spec.add_development_dependency "minitest", "~> 5.16"
  spec.add_development_dependency "minitest-rails", "~> 6.1"
  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 13.0"
end
