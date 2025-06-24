# frozen_string_literal: true

RSpec.describe GlassSphere::MapStorage::ExampleGroups do # rubocop:disable Metrics/BlockLength
  describe '#initialize' do
    let(:example_groups) { {} }

    subject { described_class.new(example_groups:) }

    it 'freezes the instance' do
      expect(subject).to be_frozen
    end
  end

  describe '#example_groups' do
    let(:example_groups) { {} }

    subject { described_class.new(example_groups:).example_groups }

    it 'returns the example groups' do
      expect(subject).to eq(example_groups)
    end
  end
end
