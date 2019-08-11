require_relative("../models/Tag.rb")

# INDEX
get '/tags' do
  @tags = Tag.all()
  erb(:'/tags/index')
end
