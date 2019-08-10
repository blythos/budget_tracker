require("pry-byebug")
require_relative("../models/Tag.rb")
require_relative("../models/Merchant.rb")
require_relative("../models/Transaction.rb")

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


binding.pry
nil
