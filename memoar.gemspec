# frozen_string_literal: true

require_relative "lib/memoar/version"

Gem::Specification.new do |spec|
  spec.name = "memoar"
  spec.version = Memoar::VERSION
  spec.authors = ["Stoyan Nikolov"]
  spec.email = ["s.nikolov@clock-hs.com"]

  spec.summary = "A simple versioning gem for ActiveRecord models using a JSON column."
  spec.description = "Memoar tracks changes on specified model fields and stores them in a serialized text column."

  spec.homepage = "https://github.com/amigobg/memoar"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.0.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/amigobg/memoar"
  spec.files         = Dir["lib/**/*", "README.md", "LICENSE", "Rakefile"]
  spec.require_paths = ["lib"]

  spec.add_dependency "rails", ">= 6.0"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
