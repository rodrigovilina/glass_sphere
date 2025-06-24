# frozen_string_literal: true

RSpec.describe GlassSphere::RSpec::Runner::Configuration do
  describe '#initialize' do
  end

  describe '#[]' do
    context 'when key is :log_file' do
      let(:config) { described_class.new }

      it 'returns the log_file' do
        expect(config[:log_file]).to eq(config.log_file)
      end
    end

    context 'when key is not found' do
      let(:config) { described_class.new }

      it 'returns nil' do
        expect(config[:unknown_key]).to be_nil
      end
    end
  end

  describe '#log_file' do
    context 'env value' do
      let(:config) { described_class.new }

      it 'returns the env value' do
        allow(ENV).to receive(:fetch).with(
          'GLASS_SPHERE_LOG_FILE',
          'log/glass_sphere.log'
        ).and_return('env_glass_sphere.log')

        expect(config.log_file).to eq(Pathname.new('env_glass_sphere.log'))
      end
    end

    context 'default value' do
      let(:config) { described_class.new }

      it 'returns the default value' do
        expect(config.log_file).to eq(Pathname.new('log/glass_sphere.log'))
      end
    end

    context 'config value' do
      let(:config) { described_class.new(log_file: 'config_glass_sphere.log') }

      it 'returns the config value' do
        expect(config.log_file).to eq(Pathname.new('config_glass_sphere.log'))
      end
    end
  end
end
