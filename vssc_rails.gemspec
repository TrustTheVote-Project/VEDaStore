$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "vssc_rails/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "vssc_rails"
  s.version     = VsscRails::VERSION
  s.authors     = [""]
  s.email       = ["alex.mekelburg@gmail.com"]
  s.homepage    = "TODO"
  s.summary     = "Parser and DB structure for VSSC election data schema"
  s.description = "Parses VSSC election data schema and saves to the DB. Exports from the DB into valid VSSC format."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["spec/**/*"]

  s.add_dependency "rails", "~> 4.2.1"
  s.add_dependency "nokogiri", "~> 1.6.0"

  s.add_development_dependency "mysql2"
  s.add_development_dependency 'byebug'
  s.add_development_dependency 'rspec-rails', '~> 3.0'
  
  
end
