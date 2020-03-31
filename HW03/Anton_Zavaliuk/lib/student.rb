class Student
  attr_accessor :name, :mark, :amount

  def initialize(name, mark, amount)
    @name = name
    @mark = mark
    @amount = amount
  end
end

student = Student.new('Antt', 5, 2)
post_gres = PostGres.instance
# post_gres.init
post_gres.add(student)
student2 = Student.new('Antt', 6, 3)
post_gres.update(student2)
post_gres.delete(student2)
