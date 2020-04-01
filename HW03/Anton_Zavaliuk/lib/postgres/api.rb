require 'pg'

class PostGres # rubocop:disable Metrics/ClassLength
  @instance = new

  private_class_method :new

  class << self
    attr_reader :instance
  end

  def connect
    con = PG.connect dbname: 'rubyhw', user: 'postgres', password: 'zzA7KGVN'
  rescue PG::Error => e
    puts e.message
  else
    con
  end

  def init_students
    con = connect
    con.exec 'DROP TABLE IF EXISTS students'
    con.exec "CREATE TABLE students(id serial primary key,
        name varchar(20), surname varchar(20), mark int, amount int)"
    con.exec "INSERT INTO students (name, surname, mark, amount)
              VALUES('Anton', 'Zavaliuk', 7, 8)"
    con.exec "INSERT INTO students (name, surname, mark, amount)
              VALUES('Tanya', 'Alabeshkina', 9, 4)"
    close(con)
  end

  def init_mentors
    con = connect
    con.exec 'DROP TABLE IF EXISTS mentors'
    con.exec "CREATE TABLE mentors(id serial primary key,
        name varchar(20), surname varchar(20), level int)"
    con.exec "INSERT INTO mentors (name, surname, level)
              VALUES('Anton', 'Zaletilo', 1)"
    con.exec "INSERT INTO mentors (name, surname, level)
              VALUES('Lesha', 'SuperKlio', 2)"
    close(con)
  end

  def add_student(value)
    con = connect
    str = "INSERT INTO students (name, surname, mark, amount) VALUES
     ('#{value.name}', '#{value.surname}', #{value.mark}, #{value.amount})"
    con.exec str
    close(con)
  end

  def add_mentor(value)
    con = connect
    str = "INSERT INTO mentors (name, surname, level) VALUES
     ('#{value.name}', '#{value.surname}', #{value.level})"
    con.exec str
    close(con)
  end

  def update_student(value)
    con = connect
    con.exec "UPDATE students SET mark = #{value.mark},
      amount = #{value.amount} WHERE name = '#{value.name}'
      AND surname = '#{value.surname}'"
    close(con)
  end

  def levelup_mentor(value)
    con = connect
    con.exec "UPDATE mentors SET level = #{value.level + 1},
      WHERE name = '#{value.name}' AND surname = '#{value.surname}'"
    close(con)
  end

  def select(value)
    con = connect
    a = if value.class == Student
          con.exec "select * FROM studentsWHERE name = '#{value.name}'
                    AND surname = '#{value.surname}'"
        else
          con.exec "select * FROM mentors WHERE name = '#{value.name}'
                    AND surname = '#{value.surname}'"
        end
    close(con)
    a.first
  end

  def delete(value)
    con = connect
    if value.class == Student
      con.exec "DELETE FROM students WHERE name = '#{value.name}'
                AND surname = '#{value.surname}'"
    else
      con.exec "DELETE FROM mentors WHERE name = '#{value.name}'
                AND surname = '#{value.surname}'"
    end
    close(con)
  end

  def init_notifications
    con = connect
    con.exec 'DROP TABLE IF EXISTS notifications'
    con.exec "CREATE TABLE notifications(id serial primary key,
        message text, m_name varchar(20), m_surname varchar(20),
        st_name varchar(20), st_surname varchar(20))"
    close(con)
  end

  def add_notification(value, mentor, student)
    con = connect
    str = "INSERT INTO notifications
           (message, m_name, m_surname, st_name, st_surname)
           VALUES ('#{value}', '#{mentor.name}', '#{mentor.surname}',
           '#{student.name}', '#{student.surname}')"
    con.exec str
    close(con)
  end

  def delete_notification(mentor, student)
    con = connect
    con.exec "DELETE FROM notifications WHERE m_name = '#{mentor.name}'
              AND m_surname = '#{mentor.surname}'
              AND st_name = '#{student.name}'
              AND st_surname = '#{student.surname}'"
    close(con)
  end

  def close(con)
    con&.close
  end
end
