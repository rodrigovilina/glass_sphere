# frozen_string_literal: true

module GlassSphere
  class MapStorage
    class Metadata
      extend T::Sig

      sig { params(metadata: Hash).void }
      def initialize(metadata:)
        @metadata = metadata

        freeze
      end

      sig { returns(Hash) }
      attr_reader :metadata

      sig { returns(String) }
      def type
        metadata[:type]
      end
    end
  end
end
