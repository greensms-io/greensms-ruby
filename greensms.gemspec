require_relative "lib/greensms/version"

Gem::Specification.new do |spec|
  spec.name = "greensms"
  spec.version = GreenSMS::VERSION
  spec.platform = Gem::Platform::RUBY
  spec.authors = ["Team GreenSMS"]
  spec.email = ["support@greensms.ru"]

  spec.summary = "GreenSMS Ruby Gem"
  spec.description = "GREENSMS API: SMS, Viber, Voce, Call, HLR, Pay"
  spec.homepage = "https://github.com/greensms-ru/greensms-ruby"
  spec.license = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = spec.homepage

  spec.add_development_dependency "bundler", ">= 1.0.0"
  spec.add_dependency "faraday"
  spec.add_dependency "json-schema"
  spec.add_dependency "rake"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path("..", __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
