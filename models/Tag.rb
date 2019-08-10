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

  def update()
    sql = "UPDATE tags SET name = $1 WHERE id = $2"
    values = [@name, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM tags WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM tags"
    tags = SqlRunner.run(sql)
    return tags.map { |tag| Tag.new(tag) }
  end

  def self.find(id)
    sql = "SELECT * FROM tags WHERE id = $1"
    values = [id]
    tag = SqlRunner.run(sql, values).first()
    return Tag.new(tag)
  end

  def transactions()
    sql = "SELECT * FROM transactions INNER JOIN tags ON tags.id = transactions.tag_id WHERE transactions.tag_id = $1"
    values = [@id]
    transactions = SqlRunner.run(sql, values)
    return transactions.map { |transaction| Transaction.new(transaction) }
  end

end
