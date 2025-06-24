# frozen_string_literal: true

module GlassSphere
  class GitRepo
    extend T::Sig
    include Todo

    sig { params(path: Pathname).void }
    def initialize(path)
      @path = path
      @repo = Git.open(path)

      freeze
    end

    sig { returns(Pathname) }
    attr_reader :path

    sig { returns(Git::Base) }
    attr_reader :repo

    sig { params(path: Pathname).returns(GitRepo) }
    def self.open(path)
      new(path) if exists?(path)
    end

    sig { params(path: Pathname).returns(T::Boolean) }
    def self.exists?(path)
      path.join('.git').directory?
    end

    # sig { params(args: T.untyped).returns(Git::Object::Commit) }
    def merge_base(from, to)
      ap 'Inside GitRepo#merge_base'
      if from.nil?
        repo.object('HEAD')
      else
        repo.merge_base(from, to)
      end
    end

    sig { params(from: String, to: T.nilable(String)).returns(SourceDiff) }
    def diff(from = 'HEAD', to = nil)
      SourceDiff.new(repo.diff(from, to))
    end
  end
end
