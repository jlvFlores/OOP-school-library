require './decorators/capitalize_decorator'

describe CapitalizeDecorator do
  let(:nameable) { Nameable.new }
  let(:base_decorator) { BaseDecorator.new(nameable) }
  let(:decorator) { CapitalizeDecorator.new(base_decorator) }

  context 'when calling correct_name' do
    it 'capitalizes the name given' do
      allow(nameable).to receive(:correct_name).and_return('john')
      expect(decorator.correct_name).to eq('John')
    end

    it "does not capitalize the name if it's already capitalized" do
      allow(nameable).to receive(:correct_name).and_return('John')
      expect(decorator.correct_name).to eq('John')
    end
  end
end
