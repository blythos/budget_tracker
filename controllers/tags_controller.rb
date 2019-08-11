require_relative("../models/Tag.rb")

# INDEX
get '/tags' do
  @tags = Tag.all()
  erb(:'/tags/index')
end

# CREATE
post '/tags' do
  tag = Tag.new(params)
  tag.save()
  redirect to ('/tags')
end

# NEW
get '/tags/new' do
  erb(:'/tags/new')
end

# EDIT
get '/tags/:id/edit' do
  @tag = Tag.find(params['id'].to_i)
  erb(:'/tags/edit')
end

# DESTROY
post '/tags/:id/delete' do
  tag = Tag.find(params['id'].to_i)
  tag.delete()
  redirect to ('/tags')
end

# UPDATE
post '/tags/:id' do
  tag = Tag.new(params)
  tag.update()
  redirect to ("/tags/#{tag.id}")
end

# SHOW
get '/tags/:id' do
  @tag = Tag.find(params['id'].to_i)
  erb(:'/tags/show')
end
