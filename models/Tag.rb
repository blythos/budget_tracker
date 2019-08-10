require_relative("../db/sql_runner.rb")

class Tag

  attr_accessor :name
  attr_reader :id

  def initialize(tag)
    @id = tag['id'].to_i if tag['id']
    @name = tag['name']
  end

end
