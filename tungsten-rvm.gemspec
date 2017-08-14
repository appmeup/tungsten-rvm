# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tungsten/rvm/version'

Gem::Specification.new do |spec|
  spec.name          = "tungsten-rvm"
  spec.version       = '0.1.0'
  spec.authors       = ["Hans Gamarra"]
  spec.email         = ["hans@appmeup.co"]

  spec.summary       = %q{RVM library for Tungsten}
  spec.description   = %q{RVM library for Tungsten.}
  spec.homepage      = "http://appmeup.co"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "https://rubygems.org"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
  spec.add_development_dependency "byebug", '9.0.6'

  spec.add_dependency "tungsten", '0.1.0'
end
