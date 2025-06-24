# frozen_string_literal: true

RSpec.describe GlassSphere::RSpec::Runner do
  describe '.config' do
    specify do
      expect(described_class.config).to be_a(GlassSphere::RSpec::Runner::Configuration)
    end

    context 'when config file does not exist' do
      it 'returns a Configuration with default values', :aggregate_failures do
        allow(GlassSphere::RSpec::Runner::Configuration).to receive(:new).and_call_original

        expect(described_class.config).to be_a(GlassSphere::RSpec::Runner::Configuration)
        expect(GlassSphere::RSpec::Runner::Configuration).to have_received(:new).with({})
      end
    end

    context 'when config file exists' do
      let(:file_double) { instance_double(Pathname, exist?: true, read: '{}') }

      it 'returns a Configuration with default values', :aggregate_failures do
        allow(Pathname).to receive(:new).and_call_original
        allow(Pathname).to receive(:new).with('glass_sphere.yml').and_return(file_double)
        allow(GlassSphere::RSpec::Runner::Configuration).to receive(:new).and_call_original

        expect(described_class.config).to be_a(GlassSphere::RSpec::Runner::Configuration)
        expect(GlassSphere::RSpec::Runner::Configuration).to have_received(:new).with({})
      end
    end
  end

  describe '.config_file' do
    let(:file_double) { instance_double(Pathname, exist?: true) }
    let(:env_file) { 'spec/fixtures/glass_sphere.yml' }
    let(:root_file) { 'glass_sphere.yml' }
    let(:config_file) { 'config/glass_sphere.yml' }

    context 'when GLASS_SPHERE_CONFIG is set and file exists' do
      it 'returns a Pathname for said file' do
        allow(ENV).to receive(:[]).with('GLASS_SPHERE_CONFIG').and_return(env_file)
        allow(Pathname).to receive(:new).and_call_original
        allow(Pathname).to receive(:new).with(env_file).and_return(file_double)

        expect(described_class.config_file).to eq(file_double)
      end
    end

    context 'when root file exists' do
      it 'returns a Pathname for said file' do
        allow(Pathname).to receive(:new).and_call_original
        allow(Pathname).to receive(:new).with(root_file).and_return(file_double)

        expect(described_class.config_file).to eq(file_double)
      end
    end

    context 'when root file does not exist and config file exists' do
      it 'returns a Pathname for said file' do
        allow(Pathname).to receive(:new).and_call_original
        allow(Pathname).to receive(:new).with(config_file).and_return(file_double)

        expect(described_class.config_file).to eq(file_double)
      end
    end
  end
end
