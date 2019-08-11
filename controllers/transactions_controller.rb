require_relative("../models/Transaction.rb")

get '/transactions' do
  @transactions = Transaction.all()
  erb(:'transactions/index')
end
