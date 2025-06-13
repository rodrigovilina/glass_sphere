# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'glass_sphere/version'

Gem::Specification.new do |spec|
  spec.name          = 'glass_sphere'
  spec.version       = GlassSphere::VERSION
  spec.authors       = ['Rodrigo Vilina']
  spec.email         = ['me@rodrigovilina.com']

  spec.summary       = 'A library for RSpec regression test selection'
  spec.description   = 'Provides simple way to integrate regression test selection approach to your RSpec test suite'
  spec.homepage      = 'https://github.com/rodrigovilina/glass_sphere'

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'bin'
  spec.executables   = [File.basename('bin/glass_sphere')]
  spec.require_paths = ['lib']

  spec.add_dependency 'amazing_print'
  spec.add_dependency 'git'
  spec.add_dependency 'irb'
  spec.add_dependency 'ostruct'
  spec.add_dependency 'sorbet-runtime'
  spec.add_dependency 'zeitwerk'

  spec.required_ruby_version = '> 3.2.0'

  spec.add_development_dependency 'actionview'
  spec.add_development_dependency 'activerecord'
  spec.add_development_dependency 'factory_bot'
  spec.add_development_dependency 'i18n'
  spec.add_development_dependency 'parser'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'pry-byebug'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'rubocop-rspec'
  spec.add_development_dependency 'rubocop-vaporyhumo'
  spec.add_development_dependency 'simplecov'
  spec.add_development_dependency 'sqlite3'
  spec.add_development_dependency 'yard'
  spec.metadata['rubygems_mfa_required'] = 'true'
end
