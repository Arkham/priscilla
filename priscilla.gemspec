# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'priscilla/version'

Gem::Specification.new do |spec|
  spec.name          = "priscilla"
  spec.version       = Priscilla::VERSION
  spec.authors       = ["Ju Liu"]
  spec.email         = ["ju.liu@welaika.com"]
  spec.summary       = %q{Frock up your console messages}
  spec.description   = %q{Don't let your console messages drown in a wall of text, make them stand out}
  spec.homepage      = "http://github.com/Arkham/priscilla"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.start_with? "images" }
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "colorize", "~> 0.7"
  spec.add_dependency "rumoji", "~> 0.3"

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake", "~> 10.1"
  spec.add_development_dependency "rspec", "~> 2.14"
end
