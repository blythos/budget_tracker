require_relative('../db/sql_runner.rb')
require_relative('./Merchant.rb')
require_relative('./Tag.rb')

class Transaction

  attr_accessor :amount, :transaction_date, :transaction_time, :tag_id, :merchant_id
  attr_reader :id

  def initialize(transaction)
    @id = transaction['id'].to_i if transaction['id']
    @amount = transaction['amount']
    @transaction_date = transaction['transaction_date']
    @transaction_time = transaction['transaction_time']
    @tag_id = transaction['tag_id']
    @merchant_id = transaction['merchant_id']
  end

  def save()
    sql = "INSERT INTO transactions (amount, transaction_date, transaction_time, tag_id, merchant_id) VALUES ($1, $2, $3, $4, $5) RETURNING id"
    values = [@amount, @transaction_date, @transaction_time, @tag_id, @merchant_id]
    result = SqlRunner.run(sql, values).first()
    @id = result['id'].to_i
  end

  def self.delete_all()
    sql = "DELETE FROM transactions"
    SqlRunner.run(sql)
  end

  def update()
    sql = "UPDATE transactions SET (amount, transaction_date, transaction_time, tag_id, merchant_id) = ($1, $2, $3, $4, $5) WHERE id = $6 "
    values = [@amount, @transaction_date, @transaction_time, @tag_id, @merchant_id, @id]
    SqlRunner.run(sql, values)
  end

 def merchant()
   sql = "SELECT * FROM merchants INNER JOIN transactions ON transactions.id = merchants.transactions_id WHERE merchants.transactions.id = $1"
   values = [@id]
   merchant = SqlRunner.run(sql, values).first
   return Merchant.new(merchant)
 end

 def tag()
   sql = "SELECT * FROM tags INNER JOIN transactions ON tags.id = transactions.tag_id WHERE transactions.tag_id = $1"
   values = [@id]
   tag = SqlRunner.run(sql, values).first
   return Tag.new(tag)
 end

end
