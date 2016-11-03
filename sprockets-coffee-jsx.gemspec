require 'rubygems'
require 'yaml'
package = YAML.load_file(File.join(File.dirname(__FILE__), 'package.json'))

$:.push File.expand_path("../lib", __FILE__)

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "sprockets-coffee-jsx"
  s.version     = package["version"]
  s.author      = "Rael Gugelmin Cunha"
  s.email       = "rael.gc@gmail.com"
  s.homepage    = "https://github.com/raelgc/sprockets-coffee-jsx"
  s.summary     = "Coffeescript with React JSX (CJSX) via Sprockets"
  s.description = <<-EOS
    Preprocessor for Coffeescript with React JSX (CJSX).
    This gem makes it easy to integrate this into the Rails asset pipeline or other Sprockets chains.
    If you want to use CJSX without Sprockets, see the coffee-jsx gem, or the coffee-jsx npm module.
    This is an update version of sprockets-coffee-jsx gem.
  EOS
  s.license     = "MIT"

  s.files = Dir["{lib}/**/*"] + ["LICENSE", "Rakefile", "README.md"]
  #s.test_files = Dir["test/**/*"]

  s.add_runtime_dependency 'coffee-react', ">= 3.4.0"
  s.add_runtime_dependency 'coffee-script'
  s.add_runtime_dependency 'tilt'
  s.add_runtime_dependency 'sprockets'
end
