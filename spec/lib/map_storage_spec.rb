# frozen_string_literal: true

RSpec.describe GlassSphere::MapStorage do
  describe GlassSphere::MapStorage::NoFilesFoundError do
    it 'is a standard error' do
      expect(described_class).to be < StandardError
    end
  end
end
