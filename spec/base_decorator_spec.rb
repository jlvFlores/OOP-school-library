require './decorators/base_decorator'

describe BaseDecorator do
  let(:nameable) { Nameable.new }
  let(:decorator) { BaseDecorator.new(nameable) }

  context 'when calling correct_name' do
    it 'delegates to the nameable object' do
      expect(nameable).to receive(:correct_name).and_return('John Doe')
      expect(decorator.correct_name).to eq('John Doe')
    end
  end
end
