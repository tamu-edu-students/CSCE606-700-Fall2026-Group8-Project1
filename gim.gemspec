# frozen_string_literal: true

require_relative "lib/gim/version"

Gem::Specification.new do |spec|
  spec.name = "gim"
  spec.version = Gim::VERSION
  spec.authors = ["Colin Bakker"]
  spec.email = ["cbakker207@tamu.edu"]

  spec.summary = "Manage grocery inventory and restocking needs."
  spec.description = "A command-line grocery inventory manager for adding, removing, and reviewing items."
  spec.homepage = "https://github.com/tamu-edu-students/CSCE606-700-Fall2026-Group8-Project1"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.1.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  gemspec = File.basename(__FILE__)
  spec.files = IO.popen(%w[git ls-files -z], chdir: __dir__, err: IO::NULL) do |ls|
    ls.readlines("\x0", chomp: true).reject do |f|
      (f == gemspec) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git appveyor Gemfile])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
