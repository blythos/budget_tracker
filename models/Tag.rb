require_relative("../db/sql_runner.rb")

class Tag

  attr_accessor :tag
  attr_reader :id

  def intialize(tag)
    @id = tag['id'].to_i if tag['id']
    @name = tag['name']
  end

end
