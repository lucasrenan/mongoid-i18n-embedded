$:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name = "mongoid_i18n_embedded"
  s.summary = "This gem provides functionalities to manipulate internationalized data using Mongoid."
  s.description = "This gem provides functionalities to manipulate internationalized data using Mongoid."
  s.files = Dir["{app,lib,config}/**/*"] + ["MIT-LICENSE", "Rakefile", "Gemfile", "README.rdoc"]
  s.authors = ["lucas renan", "tiago godinho"]
  s.email = "contato@lucasrenan.com"
  s.homepage = "https://github.com/lucasrenan/mongoid-i18n-embedded"
  s.version = "0.0.3"
  
  s.require_paths = ["lib"]


  s.add_dependency "mongoid", "~> 2.4.8"
end