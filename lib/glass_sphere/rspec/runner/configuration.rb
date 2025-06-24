# frozen_string_literal: true

module GlassSphere
  module RSpec
    class Runner
      # Configuration for the RSpec runner.
      class Configuration
        def initialize(config = {})
          values = { log_file: 'log/glass_sphere.log' }.merge(config)

          @log_file = Pathname.new(ENV.fetch('GLASS_SPHERE_LOG_FILE', values[:log_file]))
        end

        attr_reader :log_file

        def [](key)
          case key
          when :log_file then log_file
          end
        end
      end
    end
  end
end
