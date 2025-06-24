# frozen_string_literal: true

RSpec.describe GlassSphere::Todo do
  describe '#todo!' do
    specify do
      dummy_class = Class.new do
        include GlassSphere::Todo
      end

      expect { dummy_class.new.todo!('test') }
        .to raise_error(NotImplementedError, 'test')
    end
  end
end
