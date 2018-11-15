
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "cloudbuild_viz/version"

Gem::Specification.new do |spec|
  spec.name          = "cloudbuild_viz"
  spec.version       = CloudbuildViz::VERSION
  spec.authors       = ["Weiyuan"]
  spec.email         = ["weiyuan.lane@gmail.com"]

  spec.summary       = %q{ Summary }
  spec.description   = %q{ Description }
  spec.homepage      = "TODO: Put your gem's website or public repo URL here."
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"

  spec.add_dependency 'ruby-graphviz', '~> 1.2'
  spec.add_dependency 'thor', '~> 0.20'
end
