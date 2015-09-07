# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user = CreateAdminService.new.call
puts 'CREATED ADMIN USER: ' << user.email

BannerRegion.destroy_all
regions = [
	{ width: '100%', height: '350px',  name: 'Верхний баннер' },
	{ width: '255px', height: '400px', name: 'Боковой' },
	{ width: '500px', height: '60px',  name: 'Под новостями широкий' },
	{ width: '320px', height: '60px',  name: 'Под новостями узкий' },
	{ width: '100%', height: '150px',  name: 'Нижний баннер' }
]
puts 'Default users:'
BannerRegion.create(regions).each do |region|
  if region.save
    puts "success"
  else
    puts '>>> User not created!'
  end
end