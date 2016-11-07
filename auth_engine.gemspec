$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "auth_engine/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "auth_engine"
  s.version     = AuthEngine::VERSION
  s.authors     = ["Helen Zhang"]
  s.email       = ["helenfanzhang@gmail.com"]
  s.homepage    = "http://github.com/nuthintrue"
  s.summary     = "http://github.com/nuthintrue"
  s.description = "http://github.com/nuthintrue"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.0.0", ">= 5.0.0.1"
  s.add_dependency "grape", "~> 0.17.0"
  s.add_dependency 'grape-swagger', '~> 0.23'
  s.add_dependency 'grape-swagger-rails', '~> 0.2'
  s.add_dependency 'knock', '~> 1.5'
  s.add_development_dependency "pg"
  s.add_development_dependency "rspec-rails", "~> 3.4"
  s.add_development_dependency "timecop", "~> 0.8"
  s.add_development_dependency "factory_girl_rails", "~> 4.7"
  s.add_development_dependency "faker", "~> 1.6.5"
  s.add_development_dependency "byebug"
  s.add_development_dependency "shoulda-matchers"
end
