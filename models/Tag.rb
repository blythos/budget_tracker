require_relative("../db/sql_runner.rb")

class Tag

  attr_accessor :name
  attr_reader :id

  def initialize(tag)
    @id = tag['id'].to_i if tag['id']
    @name = tag['name']
  end

  def save()
    sql = "INSERT INTO tags (name) VALUES ($1) RETURNING id"
    values = [@name]
    results = SqlRunner.run(sql, values).first
    @id = results['id'].to_i
  end

  def self.delete_all()
    sql = "DELETE FROM tags"
    SqlRunner.run(sql)
  end


end
