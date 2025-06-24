# frozen_string_literal: true

module GlassSphere
  module RSpec
    # Custom RSpec runner for GlassSphere.
    class Runner < ::RSpec::Core::Runner
      def self.prepare
        config['runner_class'].load_execution_map
      end

      def self.config
        config_options = if config_file
                           YAML.safe_load(config_file.read)
                         else
                           {}
                         end

        Configuration.new(config_options)
      end

      def self.config_file # rubocop:disable Metrics/CyclomaticComplexity,Metrics/MethodLength
        env_file = ENV['GLASS_SPHERE_CONFIG']&.then { Pathname.new(_1) }
        root_file = Pathname.new('glass_sphere.yml')
        config_file = Pathname.new('config/glass_sphere.yml')

        case
        when env_file&.exist? then env_file
        when root_file.exist? then root_file
        when config_file.exist? then config_file
        end
      end
    end
  end
end
