module StudentObserver
  def initialize
    @students = []
  end

  def add_student(student)
    @students << student
  end

  def delete_student(student)
    @students.delete(student)
  end

  def notify_students(students, filename)
    students.each(&:notify_student)
    students.each do |student|
      student.notifications << filename + " from mentor #{name}"
    end
  end
end
