# frozen_string_literal: true

module GlassSphere
  class MapStorage
    class ExampleGroups
      extend T::Sig

      sig { params(example_groups: T::Hash[Symbol, T.untyped]).void }
      def initialize(example_groups:)
        @example_groups = example_groups

        freeze
      end

      sig { returns(T::Hash[Symbol, T.untyped]) }
      attr_reader :example_groups
    end
  end
end
