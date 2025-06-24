# frozen_string_literal: true

module GlassSphere
  class MapStorage
    class YAMLStorage
      extend Todo
      extend T::Sig

      sig { params(path: Pathname).returns(GlassSphere::ExecutionMap) }
      def self.load(path)
        meta, example_groups = *read_files(paths(path)).transpose

        metadata = guard_metadata_consistency(meta)
        example_groups = ExampleGroups.new(example_groups: example_groups.compact.inject(&:merge!))

        case metadata.type
        when 'GlassSphere::ExecutionMap' then ExecutionMap.new(metadata:, example_groups:)
        else raise "Unknown type: #{metadata.type}"
        end
      end

      sig { params(paths: T::Array[Pathname]).returns(T::Array[[Hash, Hash]]) }
      def self.read_files(paths)
        paths.map do |file|
          metadata, *example_groups = file.read.split("---\n").reject(&:empty?).map do |yaml|
            YAML.safe_load(yaml, permitted_classes: [Symbol])
          end

          [metadata, example_groups.compact.inject(&:merge!)]
        end
      end

      sig { params(path: Pathname).returns(T::Array[Pathname]) }
      def self.paths(path)
        paths = if path.directory?
                  path.each_child.select(&:file?)
                else
                  [path]
                end

        raise NoFilesFoundError, "No files or folder exists #{path}" unless paths.any?(&:exist?)

        paths
      end

      sig { params(metadata: T::Array[Hash]).returns(Metadata) }
      def self.guard_metadata_consistency(metadata)
        uniq = metadata.uniq
        raise "Can't load execution maps with different metadata. Metadata: #{uniq}" if uniq.size > 1

        Metadata.new(metadata: uniq.first)
      end
    end
  end
end
