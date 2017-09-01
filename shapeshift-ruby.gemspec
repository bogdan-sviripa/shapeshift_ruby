# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'shapeshift_ruby/version'

Gem::Specification.new do |spec|
  spec.name          = 'shapeshift_ruby'
  spec.version       = ShapeShiftRuby::VERSION
  spec.authors       = ['Bogdan Sviripa']
  spec.email         = ['iamkidjoe@gmail.com']

  spec.summary       = 'A ruby wrapper for the ShapeShift API'
  spec.description   = 'A ruby wrapper for the ShapeShift API'
  spec.homepage      = 'https://github.com/iamkidjoe/shapeshift_ruby'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.14'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_runtime_dependency 'rest-client', '~> 2.0.2'
end
