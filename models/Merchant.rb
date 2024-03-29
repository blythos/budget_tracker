require_relative("../db/sql_runner.rb")

class Merchant

  attr_accessor :name
  attr_reader :id

  def initialize(merchant)
    @id = merchant['id'].to_i if merchant['id']
    @name = merchant['name']
  end

  def save()
    sql = "INSERT INTO merchants (name) VALUES ($1) RETURNING id"
    values = [@name]
    results = SqlRunner.run(sql, values).first()
    @id = results['id'].to_i
  end

  def self.delete_all()
    sql = "DELETE FROM merchants"
    SqlRunner.run(sql)
  end

  def update()
    sql = "UPDATE merchants SET name = $1 WHERE id = $2"
    values = [@name, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM merchants WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM merchants ORDER BY name"
    merchants = SqlRunner.run(sql)
    return merchants.map { |merchant| Merchant.new(merchant)}
  end

  def self.find(id)
    sql = "SELECT * FROM merchants WHERE id = $1"
    values = [id]
    merchant = SqlRunner.run(sql, values).first()
    return Merchant.new(merchant)
  end

  def transactions(number = nil)
    sql = "SELECT * FROM transactions INNER JOIN merchants ON merchants.id = transactions.merchant_id WHERE transactions.merchant_id = $1 ORDER BY transaction_date DESC LIMIT $2"
    values = [@id, number]
    transactions = SqlRunner.run(sql, values)
    return transactions.map { |transaction| Transaction.new(transaction) }
  end

  def total()
    total = 0
    for transaction in transactions()
      total += transaction.amount
    end
    return total
  end

end
