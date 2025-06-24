# frozen_string_literal: true

RSpec.describe GlassSphere::VERSION do
  it 'returns the correct version' do
    expect(GlassSphere::VERSION).to eq('0.1.0')
  end
end
