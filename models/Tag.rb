require_relative("../db/sql_runner.rb")
require_relative("./Transaction.rb")
require_relative("./Merchant.rb")

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

  # Allows you to specify the amount of transactions that the function returns.
  def transactions(number = nil)
    sql = "SELECT * FROM transactions WHERE transactions.tag_id = $1 ORDER BY transaction_date DESC LIMIT $2"
    values = [@id, number]
    transactions = SqlRunner.run(sql, values)
    return transactions.map { |transaction| Transaction.new(transaction) }
  end

  def merchants()
    sql = "SELECT merchants.* FROM merchants INNER JOIN transactions ON merchants.id = transactions.merchant_id WHERE transactions.tag_id = $1"
    values = [@id]
    merchants = SqlRunner.run(sql, values)
    return merchants.map { |merchant| Merchant.new(merchant) }
  end

  def total()
    total = 0
    for transaction in transactions()
      total += transaction.amount
    end
    return total
  end

end
