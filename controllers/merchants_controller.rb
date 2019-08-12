require_relative("../models/Merchant.rb")

# INDEX
get '/merchants' do
  @merchants = Merchant.all()
  erb(:'/merchants/index')
end

# CREATE
post '/merchants' do
  merchant = Merchant.new(params)
  merchant.save()
  redirect to ('/merchants')
end

# NEW
get '/merchants/new' do
  erb(:'/merchants/new')
end

# EDIT
get '/merchants/:id/edit' do
  @merchant = Merchant.find(params['id'].to_i)
  erb(:'/merchants/edit')
end

# DESTROY
post '/merchants/:id/delete' do
  merchant = Merchant.find(params['id'].to_i)
  merchant.delete()
  redirect to ('/merchants')
end

# UPDATE
post '/merchants/:id' do
  merchant = Merchant.new(params)
  merchant.update()
  redirect to ("/merchants/#{merchant.id}")
end

# SHOW
get '/merchants/:id' do
  @merchant = Merchant.find(params['id'].to_i)
  @transactions = @merchant.transactions()
  @total = @merchant.total()
  erb(:'/merchants/show')
end
