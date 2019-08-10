require('minitest/autorun')
require('minitest/rg')
require_relative("../Tag.rb")

class TestTag < MiniTest::Test

  def setup()
    @tag1 = Tag.new({
      'id' => 1,
      'name' => 'groceries'
    })
  end

  def test_get_name()
    result = @tag1.name
    assert_equal('groceries', result)
  end

  def test_get_id()
    result = @tag1.id
    assert_equal(1, result)
  end

end
