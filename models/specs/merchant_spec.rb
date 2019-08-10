require('minitest/autorun')
require('minitest/rg')

require_relative('../Merchant.rb')

class TestMerchant < MiniTest::Test

  def setup()
    @merchant1 = Merchant.new(
      {
        'id' => 4325,
        'name' => 'Tesco'
      }
    )
  end

  def test_get_name()
    assert_equal('Tesco', @merchant1.name)
  end

  def test_get_id()
    assert_equal(4325, @merchant1.id)
  end

end
