require './people/student'

describe Student do
  context 'when initializing with valid parameters' do
    before :each do
      @student = Student.new(1, 'name', 18, false)
    end

    it 'returns a valid Student object when given four arguments' do
      expect(@student).to be_instance_of(Student)
    end

    it "correct_name method returns the student's name" do
      expect(@student.correct_name).to eq(@student.name)
    end

    it 'can_use_services? method returns true if the student is of age or has parent_permission' do
      expect(@student.can_use_services?).to eq(true)
    end

    it 'play_hooky method returns ¯(ツ)/¯ when called' do
      expect(@student.play_hooky).to eq('¯(ツ)/¯')
    end

    it 'returns the correct hash structure when calling to_hash method' do
      expected_hash = { id: @student.id, name: @student.name, age: @student.age,
                        parent_permission: @student.parent_permission, classroom: @student.classroom }
      expect(@student.to_hash).to eq(expected_hash)
    end
  end

  context 'when initializing with invalid parameters' do
    it 'raises an ArgumentError when not given four arguments' do
      expect { Student.new(1, 'name', 18) }.to raise_exception(ArgumentError)
    end
  end
end
