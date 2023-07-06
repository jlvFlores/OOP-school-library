require './people/person'

describe Person do
  context 'when initializing with valid parameters' do
    before :each do
      @person = Person.new(1, 'name', 17, true)
    end

    it 'returns a valid Person object when given four arguments' do
      expect(@person).to be_instance_of(Person)
    end

    it "correct_name method returns the person's name" do
      expect(@person.correct_name).to eq(@person.name)
    end

    it 'can_use_services? method returns true if the person is of age or has parent_permission' do
      expect(@person.can_use_services?).to eq(true)
    end
  end

  context 'when initializing with invalid parameters' do
    it 'raises an ArgumentError when not given three or four arguments' do
      expect { Person.new(1, 'name') }.to raise_exception(ArgumentError)
    end
  end
end
