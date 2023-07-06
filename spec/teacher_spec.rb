require './people/teacher'

describe Teacher do
  context 'when initializing with valid parameters' do
    before :each do
      @teacher = Teacher.new(1, 'name', 100, 'specialty')
    end

    it 'returns a valid Teacher object when given four arguments' do
      expect(@teacher).to be_instance_of(Teacher)
    end

    it "correct_name method returns the teacher's name" do
      expect(@teacher.correct_name).to eq(@teacher.name)
    end

    it 'can_use_services? method always returns true' do
      expect(@teacher.can_use_services?).to eq(true)
    end

    it 'returns the correct hash structure when calling to_hash method' do
      expected_hash = { id: @teacher.id, name: @teacher.name, age: @teacher.age, parent_permission: true,
                        specialization: @teacher.specialization }
      expect(@teacher.to_hash).to eq(expected_hash)
    end
  end

  context 'when initializing with invalid parameters' do
    it 'raises an ArgumentError when not given four arguments' do
      expect { Teacher.new(1, 'name', 18) }.to raise_exception(ArgumentError)
    end
  end
end
