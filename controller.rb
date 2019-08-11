require('sinatra')
require('sinatra/contrib/all')
also_reload('./models/*') 
require_relative('controllers/transactions_controller.rb')

get "/" do
  erb(:home)
end
