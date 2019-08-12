require('sinatra')
require('sinatra/contrib/all')
also_reload('./models/*')
require_relative('controllers/transactions_controller.rb')
require_relative('controllers/tags_controller.rb')
require_relative('controllers/merchants_controller.rb')
require_relative('models/Converter.rb')

get "/" do
  erb(:home)
end
