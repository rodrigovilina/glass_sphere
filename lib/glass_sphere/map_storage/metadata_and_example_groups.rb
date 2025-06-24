# frozen_string_literal: true

module GlassSphere
  class MapStorage
    class MetadataAndExampleGroups
      extend T::Sig

      sig { params(metadata: Metadata, example_groups: ExampleGroups).void }
      def initialize(metadata:, example_groups:)
        @metadata = metadata
        @example_groups = example_groups

        freeze
      end

      sig { returns(Metadata) }
      attr_reader :metadata

      sig { returns(ExampleGroups) }
      attr_reader :example_groups
    end
  end
end
