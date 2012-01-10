require 'test/unit'

class CheckoutTests < Test::Unit::TestCase
	
	
	def setup
		@apple = Item.new("apple",50)
		@biscuits = Item.new("biscuits",30)
		@chocolate = Item.new("chocolate",20)
		@tea = Item.new("tea",15)
	end
	
	def test_item_price_50
		item=@apple
		assert item.price==50
	end
	
	def test_item_is_apple
		item = @apple
		assert item.name == "apple"
	end
	
	def test_item_is_apple_for_50
		item = @apple
		assert (item.name == "apple" && item.price == 50)
	end
	
	def test_item_is_biscuits_for_30
		item=@biscuits
		assert (item.name == "biscuits" && item.price==30)
	end
	
	def test_basket_empty
		basket=Basket.new
		assert basket.empty?
	end
	
	def test_basket_not_empty_when_item_added
		basket=Basket.new
		basket.add(@apple)
		assert_equal false, basket.empty?
	end
	
	def test_basket_has_no_items_when_no_items_added
		basket=Basket.new
		assert_equal 0, basket.count
	end
	
	def test_basket_has_one_item_when_one_item_added
		basket=Basket.new
		basket.add(@apple)
		assert_equal 1, basket.count
	end
	
	def test_basket_has_two_items_when_two_items_added
		basket=Basket.new
		basket.add(@apple)
		basket.add(@biscuits)
		assert_equal 2, basket.count
	end
	
	def test_basket_total_is_50_when_one_apple_added
		basket = Basket.new
		basket.add(@apple)
		assert_equal 50, basket.total_price
	end
	
	def test_basket_total_is_30_when_one_biscuits_added
		basket = Basket.new
		basket.add(@biscuits)
		assert_equal 30, basket.total_price
	end
	
	def test_basket_total_is_80_when_apple_and_biscuits_added
		basket=Basket.new
		basket.add(@apple)
		basket.add(@biscuits)
		assert_equal 80, basket.total_price
	end
	
	def test_basket_total_is_130_when_three_apples_added
		basket=Basket.new
		basket.add(@apple)
		basket.add(@apple)
		basket.add(@apple)
		assert_equal 130, basket.total_price
	end
	
	def test_basket_total_is_160_when_three_apples_and_biscuits_added
		basket=Basket.new
		basket.add(@apple)
		basket.add(@apple)
		basket.add(@apple)
		basket.add(@biscuits)
		assert_equal 160, basket.total_price
	end
	
	def test_basket_total_is_160_when_two_apples_and_biscuits_and_apple_added
		basket=Basket.new
		basket.add(@apple)
		basket.add(@apple)
		basket.add(@biscuits)
		basket.add(@apple)
		assert_equal 160, basket.total_price
	end
	
	def test_basket_total_is_175_when_two_apples_and_biscuits_and_apple_and_biscuit_added
		basket=Basket.new
		basket.add(@apple)
		basket.add(@apple)
		basket.add(@biscuits)
		basket.add(@apple)
		basket.add(@biscuits)
		assert_equal 175, basket.total_price
	end
	
	def test_basket_total_is_210_when_two_apples_and_biscuits_and_apple_and_biscuit_and_chocolate_and_tea_added
		basket=Basket.new
		basket.add(@apple)
		basket.add(@apple)
		basket.add(@biscuits)
		basket.add(@apple)
		basket.add(@biscuits)
		basket.add(@chocolate)
		basket.add(@tea)
		assert_equal 210, basket.total_price
	end
	
end

class Basket
	def initialize
		@empty=true
		@count=0
		@total_price = 0
		@items=[]
	end
	def add(item)
		@total_price += item.price
		@items<<item
		@count+=1
		@empty=false
	end
	def empty?
		return @empty
	end
	def count
		return @count
	end
	def total_price
		total_price=0;
		apples = @items.select {|item| item.name == "apple"}
		total_price+=(apples.size/3).round * 130 + (apples.size % 3) * 50
		biscuits = @items.select {|item| item.name == "biscuits"}
		total_price+=(biscuits.size/2).round * 45 + (biscuits.size % 2) * 30
		chocolates = @items.select {|item| item.name == "chocolate"}
		total_price+=chocolates.size * 20
		teas = @items.select {|item| item.name == "tea"}
		total_price+=teas.size * 15
	end
end

class Item
	def initialize(item_name, item_price)
		@price=item_price
		@name=item_name
	end
	def price
		return @price
	end
	def name
		return @name
	end
end