user = User.create(:first_name => 'Jordan', :last_name => 'Nemrow', :email => 'nemrowj@gmail.com', :password => 'password')
company = Company.create(:name => 'Nemrows Meat')
user.companies << company

supplier1 = Supplier.create(:name => 'Harris Meat')
company.suppliers << supplier1

product1 = Product.create(:name => 'Burger Meat')
supplier1.products << product1

order_day1 = OrderDay.create(:order_day => 'tuesday', :delivery_duration => 3)
supplier1.order_days << order_day1

supplier2 = Supplier.create(:name => 'Randy Sausage')
company.suppliers << supplier2

product2 = Product.create(:name => 'Chicken Meat')
supplier2.products << product2

order_day2 = OrderDay.create(:order_day => 'monday', :delivery_duration => 4)
supplier2.order_days << order_day2

supplier3 = Supplier.create(:name => 'Mikes Hams')
company.suppliers << supplier3

product3 = Product.create(:name => 'Leg Meat')
supplier3.products << product3

order_day3 = OrderDay.create(:order_day => 'friday', :delivery_duration => 4)
supplier3.order_days << order_day3
