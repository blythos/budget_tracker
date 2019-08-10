require('minitest/autorun')
require('minitest/rg')

require_relative('../Transaction.rb')

class TestTransaction < MiniTest::Test

  def setup()
    @transaction1 = Transaction.new(
      {
        'id' => 1,
        'amount' => 4599,
        'transaction_date' => '14/06/19',
        'transaction_time' => '21:47',
        'tag_id' => 67,
        'merchant_id' => 12
      }
    )
  end

  def test_get_id()
    assert_equal(1, @transaction1.id)
  end

  def test_get_amount()
    assert_equal(4599, @transaction1.amount)
  end

  def test_get_date()
    assert_equal('14/06/19', @transaction1.transaction_date)
  end

  def test_get_time()
    assert_equal('21:47', @transaction1.transaction_time)
  end

  def test_get_tag_id()
    assert_equal(67, @transaction1.tag_id)
  end

  def test_get_merchant_id()
    assert_equal(12, @transaction1.merchant_id)
  end

end
