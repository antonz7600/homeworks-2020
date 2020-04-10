module MentorObserver
  def initialize
    @mentors = []
  end

  def add_mentor(mentor)
    @mentors << mentor
  end

  def delete_mentor(mentor)
    @mentors.delete(mentor)
  end

  def notify_mentors(filename)
    mentors.each do |mentor|
      mentor.update_mentor
      mentor.notifications << filename + " from student #{name}"
    end
  end
end
