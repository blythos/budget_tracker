require_relative("../models/Transaction.rb")

# INDEX
get '/transactions' do
  @transactions = Transaction.all()
  erb(:'transactions/index')
end

# CREATE
post '/transactions' do
  transaction = Transaction.new(params)
  transaction.amount = params['pounds'].to_i * 100 + params['pence'].to_i
  transaction.save()
  redirect to ('/transactions')
end

# NEW
get '/transactions/new' do
  @tags = Tag.all()
  @merchants = Merchant.all()
  erb(:'transactions/new')
end

# EDIT
get '/transactions/:id/edit' do
  @tags = Tag.all()
  @merchants = Merchant.all()
  @transaction = Transaction.find(params['id'].to_i)
  erb(:'transactions/edit')
end

# DESTROY
post '/transactions/:id/delete' do
  transaction = Transaction.find(params['id'])
  transaction.delete()
  redirect to ('/transactions')
end

# SHOW
get '/transactions/:id' do
  @transaction = Transaction.find(params['id'].to_i)
  erb(:'transactions/show')
end
