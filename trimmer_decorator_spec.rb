require './decorators/trimmer_decorator'

describe TrimmerDecorator do
  let(:nameable) { Nameable.new }
  let(:base_decorator) { BaseDecorator.new(nameable) }
  let(:decorator) { TrimmerDecorator.new(base_decorator) }

  context 'when calling correct_name' do
    it 'trims the name to a maximum length of 10 characters' do
      allow(nameable).to receive(:correct_name).and_return('Alexandrina')
      expect(decorator.correct_name).to eq('Alexandrin')
    end

    it 'does not trim the name if it is already shorter or equal to 10 characters' do
      allow(nameable).to receive(:correct_name).and_return('Alex')
      expect(decorator.correct_name).to eq('Alex')
    end
  end
end
