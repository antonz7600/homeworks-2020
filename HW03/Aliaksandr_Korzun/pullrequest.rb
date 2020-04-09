# frozen_string_literal: true

# PullRequest class

class PullRequest
  attr_accessor :author, :code
  attr_reader :homework_number

  # Has homework object, which created mentor
  def create(author, homework, code)
    @author = author
    @homework = homework
    @code = code
  end
end
