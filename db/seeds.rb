days = ['monday','tuesday', 'wednesday', 'thursday', 'friday', 'saturday', 'sunday']

user = User.create(:first_name => 'Jordan', :last_name => 'Nemrow', :email => 'nemrowj@gmail.com', :password => 'password')
company = Company.create(:name => 'Nemrows Meat')
user.companies << company

15.times do
	supplier = Supplier.create(:name => Faker::Company.name)
	company.suppliers << supplier
	7.times do |num|
		supplier.order_days << OrderDay.create(:order_day => days[num], :delivery_duration => rand(5))
	end
	10.times do
		product = Product.create(:name => Faker::Company.bs)
		supplier.products << product
		(0..30).each do |num|
			supplier.inventories << Inventory.create(:date => ((Time.now - num.days).strftime("%Y-%m-%d")), :quantity => rand(500), :product_id => product.id)
		end
		(0..30).each do |num|
			supplier.orders << Order.create(:date => ((Time.now - num.days).strftime("%Y-%m-%d")), :quantity => rand(100), :product_id => product.id)
		end
	end
end

# product1 = Product.create(:name => 'Burger Meat')
# supplier1.products << product1

# order_day1 = OrderDay.create(:order_day => 'tuesday', :delivery_duration => 3)
# supplier1.order_days << order_day1

# supplier2 = Supplier.create(:name => 'Randy Sausage')
# company.suppliers << supplier2

# product2 = Product.create(:name => 'Chicken Meat')
# supplier2.products << product2

# order_day2 = OrderDay.create(:order_day => 'monday', :delivery_duration => 4)
# supplier2.order_days << order_day2

# supplier3 = Supplier.create(:name => 'Mikes Hams')
# company.suppliers << supplier3

# product3 = Product.create(:name => 'Leg Meat')
# supplier3.products << product3

# order_day3 = OrderDay.create(:order_day => 'friday', :delivery_duration => 4)
# supplier3.order_days << order_day3

# order_day4 = OrderDay.create(:order_day => 'monday', :delivery_duration => 1)
# supplier3.order_days << order_day4
