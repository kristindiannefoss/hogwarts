class Teacher < ActiveRecord::Base
  has_many :students

  def oldest_student
    self.students.maximum(:age)
  end

  def youngest_student
    self.students.minimum(:age)
  end
end
