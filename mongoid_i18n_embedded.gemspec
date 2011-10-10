# Provide a simple gemspec so you can easily use your enginex
# project in your rails apps through git.
Gem::Specification.new do |s|
  s.name = "mongoid_i18n_embedded"
  s.summary = "This gem provides functionalities to manipulate internationalized data using Mongoid."
  s.description = "This gem provides functionalities to manipulate internationalized data using Mongoid."
  s.files = Dir["{app,lib,config}/**/*"] + ["MIT-LICENSE", "Rakefile", "Gemfile", "README.rdoc"]
  s.version = "0.0.1"


  s.add_dependency "mongoid", ">= 2.2"
end