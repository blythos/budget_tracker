require("pry-byebug")
require_relative("../models/Tag.rb")
require_relative("../models/Merchant.rb")
require_relative("../models/Transaction.rb")

Transaction.delete_all()
Tag.delete_all()
Merchant.delete_all()


tag1 = Tag.new({'name' => 'groceries'})
tag2 = Tag.new({'name' => 'entertainment'})
tag3 = Tag.new({'name' => 'utilities'})

tag1.save()
tag2.save()
tag3.save()

merchant1 = Merchant.new({'name' => 'Tesco'})
merchant2 = Merchant.new({'name' => 'Sony'})
merchant3 = Merchant.new({'name' => 'EE'})

merchant1.save()
merchant2.save()
merchant3.save()

transaction1 = Transaction.new({
  'amount' => 3499,
  'transaction_date' => "2019-07-05",
  'transaction_time' => "13:41",
  'tag_id' => tag2.id,
  'merchant_id' => merchant2.id
})


transaction2 = Transaction.new({
    'amount' => 2744,
    'transaction_date' => "2019-03-01",
    'transaction_time' => "17:56",
    'tag_id' => tag1.id,
    'merchant_id' => merchant1.id
})


transaction3 = Transaction.new({
  'amount' => 4000,
  'transaction_date' => "2019-04-29",
  'transaction_time' => "09:00",
  'tag_id' => tag3.id,
  'merchant_id' => merchant3.id
})

transaction1.save()
transaction2.save()
transaction3.save()


binding.pry
nil
