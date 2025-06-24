# frozen_string_literal: true

module GlassSphere
  class Predictor
    extend T::Sig

    sig { params(map: ExecutionMap, repo: GitRepo, from: T.nilable(String), to: T.nilable(String)).void }
    def initialize(map, repo, from: 'HEAD', to: nil)
      @map = map
      @repo = repo
      @from = from
      @to = to
      @prediction_strategies = []
    end

    sig { returns(ExecutionMap) }
    attr_reader :map

    sig { returns(GitRepo) }
    attr_reader :repo

    sig { returns(T.nilable(String)) }
    attr_reader :from

    sig { returns(T.nilable(String)) }
    attr_reader :to

    attr_reader :prediction_strategies

    sig { returns(Prediction) }
    def prediction
      # predict! is the same as raw_prediction(diff)
      Prediction.new(filter(predict!(diff)))
    end

    sig { returns(SourceDiff) }
    def diff
      @diff ||=
        begin
          ancestor = repo.merge_base(from, to || 'HEAD').sha
          repo.diff(ancestor, to)
        end
    end

    private

    sig { params(current_diff: SourceDiff).returns(T::Array[Prediction]) }
    def predict!(current_diff)
      prediction_strategies.flat_map { |strategy| strategy.call(current_diff, map) }
    end

    def filter(example_groups)
      example_groups.compact.select { |example_group| extract_file_path(example_group).exist? }
                    .uniq
    end

    def extract_file_path(example)
      repo.repo_path.join(example.split('[').first).expand_path
    end
  end
end
