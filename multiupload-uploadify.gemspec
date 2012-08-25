$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "multiupload-uploadify/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "multiupload-uploadify"
  s.version     = MultiuploadUploadify::VERSION
  s.authors     = ["Marco Antonio de Souza"]
  s.email       = ["marcaoas@jera.com.br"]
  s.homepage    = "https://github.com/marcaoas/multiupload-uploadify"
  s.summary     = "https://github.com/marcaoas/multiupload-uploadify"
  s.description = "This gem is for use of the plugin uploadify"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.6"

  s.add_development_dependency "sqlite3"
end
