# frozen_string_literal: true

module GlassSphere
  class Prediction
    extend T::Sig

    sig { params(records: T::Array[String]).void }
    def initialize(records)
      @records = records
    end

    sig { returns(T::Array[String]) }
    def compact
      sort_by_length.each_with_object([]) do |c, result|
        result << c unless result.any? { |r| c.start_with?(r) }
      end.compact
    end

    private

    sig { returns(T::Array[String]) }
    def sort_by_length
      records.sort_by(&:length)
    end

    sig { returns(T::Array[String]) }
    attr_reader :records
  end
end
