
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "cloudbuildviz/version"

Gem::Specification.new do |spec|
  spec.name          = "cloudbuildviz"
  spec.version       = Cloudbuildviz::VERSION
  spec.authors       = ["Weiyuan"]
  spec.email         = ["weiyuan.lane@gmail.com"]

  spec.summary       = %q{ Summary }
  spec.description   = %q{ Description }
  spec.homepage      = "https://github.com/weiyuan-lane/cloudbuildviz"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.require_paths = ["lib"]
  spec.executables   = ["graph"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"

  spec.add_dependency 'ruby-graphviz', '~> 1.2'
  spec.add_dependency 'thor', '~> 0.19'
end
