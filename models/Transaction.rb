require_relative('../db/sql_runner.rb')
require_relative('./Merchant.rb')
require_relative('./Tag.rb')

class Transaction

  attr_accessor :amount, :transaction_date, :transaction_time, :tag_id, :merchant_id
  attr_reader :id

  def initialize(transaction)
    @id = transaction['id'].to_i if transaction['id']
    @amount = transaction['amount'].to_i
    @transaction_date = transaction['transaction_date']
    @transaction_time = transaction['transaction_time']
    @tag_id = transaction['tag_id'].to_i
    @merchant_id = transaction['merchant_id'].to_i
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
   sql = "SELECT * FROM merchants WHERE merchants.id = $1"
   values = [@merchant_id]
   merchant = SqlRunner.run(sql, values).first
   return Merchant.new(merchant)
 end

 def tag()
   sql = "SELECT * FROM tags WHERE tags.id = $1"
   values = [@tag_id]
   tag = SqlRunner.run(sql, values).first
   return Tag.new(tag)
 end

def pounds()
  amount_string = @amount.to_s
  return amount_string[0..-3].to_i
end

def pence()
  amount_string = @amount.to_s
  return amount_string[-2, 2].to_i
end

 def self.total()
   sql = "SELECT SUM (amount) FROM transactions"
   total = SqlRunner.run(sql).first
   return total['sum'].to_i
 end

 def self.all()
   sql = "SELECT * FROM transactions ORDER BY transaction_date DESC"
   transactions = SqlRunner.run(sql)
   return transactions.map { |transaction| Transaction.new(transaction)}
 end

 # Brings back the first x amount of transactions specified by the number you input.
 def self.top(number)
   sql = "SELECT * FROM transactions ORDER BY transaction_date DESC LIMIT $1"
   values = [number]
   transactions = SqlRunner.run(sql, values)
   return transactions.map { |transaction| Transaction.new(transaction) }
 end

 def self.find(id)
   sql = "SELECT * FROM transactions WHERE id = $1"
   values = [id]
   transaction = SqlRunner.run(sql, values).first
   return Transaction.new(transaction)
 end

 def delete()
   sql = "DELETE FROM transactions WHERE id = $1"
   values = [@id]
   SqlRunner.run(sql, values)
 end

 def year()
   return @transaction_date[0..3].to_i
 end

 def month()
   return @transaction_date[5..6].to_i
 end

 def day()
   return @transaction_date[8..9].to_i
 end

 def gbp()
   amount_string = @amount.to_s
   pence = amount_string[-2, 2]
   pounds = amount_string[0..-3]
   gbp = "£#{pounds}.#{pence}"
   return gbp
 end

 # Quick fix while reworking gbp functions.
  def self.gbp(amount)
    amount_string = amount.to_s
    pence = amount_string[-2, 2]
    pounds = amount_string[0..-3]
    gbp = "£#{pounds}.#{pence}"
    return gbp
  end

 def self.format_date(date)
   year = date[0..3]
   month = date[5..6]
   day = date[8..9]
   return "#{day}/#{month}/#{year}"
 end




end
