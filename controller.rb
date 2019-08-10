require('sinatra')
require('sinatra/contrib/all')
also_reload('./models/*')


get "/" do
  erb(:home)
end
