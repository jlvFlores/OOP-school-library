require './people/person'
require './decorators/trimmer_decorator'
require './decorators/capitalize_decorator'

describe Person do
  let(:base_decorator) { BaseDecorator.new(@person) }
  let(:trimmer_decorator) { TrimmerDecorator.new(base_decorator) }
  let(:capitalize_decorator) { CapitalizeDecorator.new(base_decorator) }

  before :each do
    @person = Person.new(1, 'alongnameiscorrected', 17, true)
  end

  context 'when initializing with valid parameters' do
    it 'returns a valid Person object when given four arguments' do
      expect(@person).to be_instance_of(Person)
    end

    it 'returns a valid Person object with its given arguments' do
      expect(@person.id).to eq(1)
      expect(@person.name).to eq('alongnameiscorrected')
      expect(@person.age).to eq(17)
      expect(@person.parent_permission).to eq(true)
      expect(@person.rentals).to eq([])
    end

    it "correct_name method returns the person's name" do
      expect(@person.correct_name).to eq(@person.name)
    end

    it "decorator correct_name methods returns the person's name shorten and capitalized" do
      allow(@person).to receive(:correct_name).and_return('alongnameiscorrected')
      expect(trimmer_decorator.correct_name).to eq('alongnamei')
      expect(capitalize_decorator.correct_name).to eq('Alongnameiscorrected')
    end

    it 'can_use_services? method returns true if the person has parent_permission' do
      expect(@person.can_use_services?).to eq(true)
    end

    it 'can_use_services? method returns true if the person is of age' do
      person = Person.new(1, 'name', 18, false)
      expect(person.can_use_services?).to eq(true)
    end

    it 'can_use_services? method returns false if the person is neither of age nor has parent_permission' do
      person = Person.new(1, 'name', 17, false)
      expect(person.can_use_services?).to eq(false)
    end
  end

  context 'when initializing with invalid parameters' do
    it 'raises an ArgumentError when not given three or four arguments' do
      expect { Person.new(1, 'name') }.to raise_exception(ArgumentError)
    end
  end
end
