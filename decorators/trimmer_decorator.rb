require './decorators/base_decorator'

class TrimmerDecorator < BaseDecorator
  def correct_name
    trimmed_name = @nameable.correct_name[0, 10]
    trimmed_name.length < @nameable.correct_name.length ? trimmed_name.to_s : trimmed_name
  end
end
