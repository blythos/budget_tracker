require("pry-byebug")
require_relative("../models/Tag.rb")
require_relative("../models/Merchant.rb")
require_relative("../models/Transaction.rb")

Transaction.delete_all()
Tag.delete_all()
Merchant.delete_all()

tag1 = Tag.new({'name' => 'general'})
tag2 = Tag.new({'name' => 'groceries'})
tag3 = Tag.new({'name' => 'entertainment'})
tag4 = Tag.new({'name' => 'utilities'})
tag5 = Tag.new({'name' => 'transport'})
tag6 = Tag.new({'name' => 'holidays'})
tag7 = Tag.new({'name' => 'eating out'})
tag8 = Tag.new({'name' => 'family'})
tag9 = Tag.new({'name' => 'personal care'})
tag10 = Tag.new({'name' => 'shopping'})


tag1.save()
tag2.save()
tag3.save()
tag4.save()
tag5.save()
tag6.save()
tag7.save()
tag8.save()
tag9.save()
tag10.save()

merchant1 = Merchant.new({'name' => 'Tesco'})
merchant2 = Merchant.new({'name' => 'Sony'})
merchant3 = Merchant.new({'name' => 'EE'})
merchant4 = Merchant.new({'name' => 'Asda'})
merchant5 = Merchant.new({'name' => 'Waitrose'})
merchant6 = Merchant.new({'name' => 'Virgin Media'})
merchant7 = Merchant.new({'name' => 'Nintendo'})
merchant8 = Merchant.new({'name' => 'Netflix'})
merchant9 = Merchant.new({'name' => 'SPT'})
merchant10 = Merchant.new({'name' => 'Primark'})
merchant11 = Merchant.new({'name' => 'TK Maxx'})
merchant12 = Merchant.new({'name' => 'Paesano'})
merchant13 = Merchant.new({'name' => 'Superdrug'})

merchant1.save()
merchant2.save()
merchant3.save()
merchant4.save()
merchant5.save()
merchant6.save()
merchant7.save()
merchant8.save()
merchant9.save()
merchant10.save()
merchant11.save()
merchant12.save()
merchant13.save()

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


transaction4 = Transaction.new({
  'amount' => 7453,
  'transaction_date' => "2019-03-12",
  'transaction_time' => "13:45",
  'tag_id' => tag2.id,
  'merchant_id' => merchant5.id
})

transaction5 = Transaction.new({
  'amount' => 1500,
  'transaction_date' => "2019-04-03",
  'transaction_time' => "08:42",
  'tag_id' => tag5.id,
  'merchant_id' => merchant9.id
})

transaction6 = Transaction.new({
  'amount' => 4500,
  'transaction_date' => "2019-04-02",
  'transaction_time' => "07:00",
  'tag_id' => tag4.id,
  'merchant_id' => merchant6.id
})

transaction7 = Transaction.new({
  'amount' => 9810,
  'transaction_date' => "2019-03-29",
  'transaction_time' => "21:44",
  'tag_id' => tag7.id,
  'merchant_id' => merchant12.id
})

transaction8 = Transaction.new({
  'amount' => 1999,
  'transaction_date' => "2019-04-25",
  'transaction_time' => "13:12",
  'tag_id' => tag6.id,
  'merchant_id' => merchant11.id
})

transaction9 = Transaction.new({
  'amount' => 695,
  'transaction_date' => "2019-04-29",
  'transaction_time' => "09:00",
  'tag_id' => tag9.id,
  'merchant_id' => merchant13.id
})

transaction10 = Transaction.new({
  'amount' => 1295,
  'transaction_date' => "2019-05-07",
  'transaction_time' => "18:10",
  'tag_id' => tag2.id,
  'merchant_id' => merchant5.id
})

transaction1.save()
transaction2.save()
transaction3.save()
transaction4.save()
transaction5.save()
transaction6.save()
transaction7.save()
transaction8.save()
transaction9.save()
transaction10.save()


binding.pry
nil
