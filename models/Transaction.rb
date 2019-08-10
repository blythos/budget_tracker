require_relative('../db/sql_runner.rb')

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

end
