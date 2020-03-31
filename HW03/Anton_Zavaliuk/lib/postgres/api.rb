require 'pg'

class PostGres
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

  def init
    con = connect
    con.exec 'DROP TABLE IF EXISTS students'
    con.exec "CREATE TABLE students(id serial primary key,
        name varchar(20), mark int, amount int)"
    con.exec "INSERT INTO students (name, mark, amount) VALUES('Anton',7, 8)"
    con.exec "INSERT INTO students (name, mark, amount) VALUES('Tanya',9, 4)"
    con.exec "INSERT INTO students (name, mark, amount) VALUES('Masha',9, 7)"
    close(con)
  end

  def add(value)
    con = connect
    str = "INSERT INTO students (name, mark, amount) VALUES
     ('#{value.name}', #{value.mark}, #{value.amount})"
    con.exec str
    close(con)
  end

  def update(value)
    con = connect
    con.exec "update students set mark = #{value.mark},
      amount = #{value.amount} where name = '#{value.name}'"
    close(con)
  end

  def delete(value)
    con = connect
    con.exec "delete from students where name = '#{value.name}'"
    close(con)
  end

  def close(con)
    con&.close
  end
end
