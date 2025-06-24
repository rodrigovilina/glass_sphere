# frozen_string_literal: true

module GlassSphere
  class ExecutionMap
    extend T::Sig

    sig { params(metadata: MapStorage::Metadata, example_groups: MapStorage::ExampleGroups, commit: T.nilable(String)).void }
    def initialize(metadata:, example_groups:, commit: nil)
      @commit = commit
      @metadata = metadata
      @example_groups = example_groups

      freeze
    end

    sig { returns(T.nilable(String)) }
    attr_reader :commit

    sig { returns(MapStorage::Metadata) }
    attr_reader :metadata

    sig { returns(MapStorage::ExampleGroups) }
    attr_reader :example_groups

    sig { returns(T::Boolean) }
    def ==(other)
      commit == other.commit && metadata == other.metadata && example_groups == other.example_groups
    end
  end
end
