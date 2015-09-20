# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# user = CreateAdminService.new.call
# puts 'CREATED ADMIN USER: ' << user.email

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

MenuCategory.destroy_all
categories = [
	{ title: 'Выпускникам', 		link: '#', publish: true, color:  'rgb(250, 204, 38)'},
	{ title: 'Раотодателям', 		link: '#', publish: true, color:  'rgb(118, 205, 255)'},
	{ title: 'Учебным заведениям', 	link: '#', publish: true, color:  'rgb(198, 43, 108)'},
	{ title: 'E-Learning', 			link: '#', publish: true, color:  'rgb(240, 64, 129)'},
	{ title: 'Календарь', 			link: '/calendar', publish: true, color:  'rgb(250, 204, 38)'}
]
puts 'Default menu categories:'
MenuCategory.create(categories).each do |category|
	if category.save
		puts 'success'
	else
		puts '>>> MenuCategory not created!'
	end
end

MenuItem.destroy_all
items = [
	{ title: 'Стажировки', 						link: '#', publish: true, menu_category_id: MenuCategory.first.id},
	{ title: 'Вакансии', 						link: '/all_vacancies', publish: true, menu_category_id: MenuCategory.first.id},
	{ title: 'Образование', 					link: '#', publish: true, menu_category_id: MenuCategory.first.id},
	{ title: 'Создать резюме', 					link: '#', publish: true, menu_category_id: MenuCategory.first.id},
	{ title: 'Опубликовать стажировку', 		link: '#', publish: true, menu_category_id: MenuCategory.second.id},
	{ title: 'Опубликовать вакансию', 			link: '#', publish: true, menu_category_id: MenuCategory.second.id},
	{ title: 'Разместить событие', 				link: '/calendar', publish: true, menu_category_id: MenuCategory.second.id},
	{ title: 'Описание услуг', 					link: '/pricelist', publish: true, menu_category_id: MenuCategory.second.id},
	{ title: 'Опубликовать курс', 				link: '#', publish: true, menu_category_id: MenuCategory.third.id},
	{ title: 'Опубликовать программу', 			link: '#', publish: true, menu_category_id: MenuCategory.third.id},
	{ title: 'Разместить событие', 				link: '/calendar', publish: true, menu_category_id: MenuCategory.third.id},
	{ title: 'Описание услуг', 					link: '#', publish: true, menu_category_id: MenuCategory.third.id},
	{ title: 'Академия экспертов', 				link: '/experts', publish: true, menu_category_id: MenuCategory.fourth.id},
	{ title: 'Вебинары GG', 					link: '/webinars', publish: true, menu_category_id: MenuCategory.fourth.id},
	{ title: 'Assessment-центр', 				link: '/assessment', publish: true, menu_category_id: MenuCategory.fourth.id},
	{ title: 'Форум "Непрерывное образование"', link: '#', publish: true, menu_category_id: MenuCategory.fourth.id}
]
puts 'Default menu items:'
MenuItem.create(items).each do |item|
	if item.save
		puts 'success'
	else
		puts '>>> MenuItem not created!'
	end
end