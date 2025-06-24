# frozen_string_literal: true

require 'amazing_print'
require 'git'
require 'ostruct'
require 'pathname'
require 'rspec/core'
require 'sorbet-runtime'
require 'yaml'
require 'zeitwerk'

loader = Zeitwerk::Loader.for_gem
loader.inflector.inflect('yaml_storage' => 'YAMLStorage', 'rspec' => 'RSpec')
loader.setup # ready!

# Main module for the library
module GlassSphere
  extend Todo

  def self.foresee(workdir: '.', map_path: 'glass_sphere_data.yml', &block)
    map = MapStorage::YAMLStorage.load(Pathname(map_path))
    Predictor.new(map, GitRepo.open(Pathname(workdir)), from: map.commit, &block).prediction.compact
  end
end

loader.eager_load
