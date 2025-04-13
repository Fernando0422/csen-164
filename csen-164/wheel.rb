
#require('sinatra')
requier('wheel')
requier('/bike')

wheel = Wheel.new(25,5)
b = Bike.new(30, 15, wheel)
puts b.gear_inches