
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "graphviz/generator/version"

Gem::Specification.new do |spec|
  spec.name          = "graphviz-generator"
  spec.version       = Graphviz::Generator::VERSION
  spec.authors       = ["seph"]
  spec.email         = ["seph@directionless.org"]

  spec.summary       = %q{Graphviz helper}
  spec.homepage      = 'https://github.com/directionless/graphviz-generator'
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.2"

  spec.add_runtime_dependency 'ruby-graphviz', '~> 1.2'
end