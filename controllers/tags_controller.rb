require_relative("../models/Tag.rb")

# INDEX
get '/tags' do
  @tags = Tag.all()
  erb(:'/tags/index')
end

# SHOW
get '/tags/:id' do
  @tag = Tag.find(params['id'].to_i)
  erb(:'/tags/show')
end
