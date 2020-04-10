class Homework
  FILE_EXTENSION = '.txt'.freeze
  HOMEWORKS_DIR_PATH = 'homeworks/'.freeze

  def self.add_homework(name, hw_filename, task)
    @filename = hw_filename + " by #{name}" + FILE_EXTENSION

    input_file_content(task)
    puts "Homework '#{@filename}' successfully created!"
  end

  def self.add_hw_solution(name, hw_filename, solution)
    open_file(hw_filename)
    @filename = hw_filename + " solution by #{name}" + FILE_EXTENSION

    input_file_content(solution)
    puts "Homework solution '#{@filename}' successfully created!"
  end

  def self.add_review(hw_filename, review)
    open_file(hw_filename)
    @filename = hw_filename + ' (review)' + FILE_EXTENSION

    input_file_content(review)
    puts "Homework review '#{@filename}' successfully created!"
  end

  def self.open_file(filename)
    filename_path = HOMEWORKS_DIR_PATH + filename + FILE_EXTENSION

    File.open(check_file_existence(filename_path), 'r') do |file|
      puts "Description:\n#{file.read}"
    end
  end

  def self.input_file_content(input)
    File.open(HOMEWORKS_DIR_PATH + @filename, 'w+') do |file|
      file.write(input)
    end
  end

  def self.check_file_existence(filename)
    if File.exist?(filename)
      filename
    else
      loop do
        puts 'Wrong name, try again (with extension):'
        @user_input = HOMEWORKS_DIR_PATH + gets.chomp
        break if File.exist?(@user_input)
      end
      @user_input
    end
  end
end
