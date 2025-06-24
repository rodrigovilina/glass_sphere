# frozen_string_literal: true

module GlassSphere
  class SourceDiff
    extend T::Sig

    sig { params(diff: Git::Diff).void }
    def initialize(diff)
      @diff = diff

      freeze
    end

    sig { returns(Git::Diff) }
    attr_reader :diff

    sig { returns(T::Array[String]) }
    def each(&)
      diff.each(&)
    end
  end
end
