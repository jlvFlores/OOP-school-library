require './people/classroom'
require './people/student'

describe Classroom do
  context 'when initializing with valid parameters' do
    before :each do
      @classroom = Classroom.new('Label')
    end

    it 'returns a valid Book object when given one arguments' do
      expect(@classroom).to be_instance_of(Classroom)
    end

    it "add_student method updates students's classroom instance var and classroom's students var" do
      student = Student.new(1, 'name', 18, true)

      @classroom.add_student(student)

      expect(student.classroom).to eq(@classroom)
      expect(@classroom.students).to eq([student])
    end
  end

  context 'when initializing with invalid parameters' do
    it 'raises an ArgumentError when not given any arguments' do
      expect { Classroom.new }.to raise_exception(ArgumentError)
    end
  end
end
