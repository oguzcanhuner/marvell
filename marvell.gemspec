lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "marvell"
  spec.version       = '0.1.1'
  spec.authors       = ["Oz Huner"]
  spec.email         = ["oguzcanhuner@gmail.com"]
  spec.description   = %q{Ruby Marvel Comics API Wrapper}
  spec.summary       = %q{Ruby Marvel Comics API Wrapper}
  spec.homepage      = "http://www.github.com/oguzcanhuner/marvell"
  spec.license       = "MIT"

  spec.files = Dir["{lib,spec}/**/*", "[A-Z]*"] - ["Gemfile.lock"]
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_path = "lib"

  spec.add_dependency "httparty"

  spec.add_development_dependency "minitest"
  spec.add_development_dependency "vcr"
  spec.add_development_dependency "webmock"
end
