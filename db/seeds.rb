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
	{ title: 'Выпускникам', 		link: '#', publish: true, color:  '#f0b334'},
	{ title: 'Учебным заведениям', 		link: '#', publish: true, color:  '#da1883'},
	{ title: 'Проекты', 	link: '#', publish: true, color:  '#0077c8'},
	{ title: 'Работодателям', 			link: '#', publish: true, color:  '#991d65'},
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
	{ title: 'Стажировки', 						link: '/company_practices', publish: true, menu_category_id: MenuCategory.first.id},
	{ title: 'Образование', 					link: '#', publish: true, menu_category_id: MenuCategory.first.id},
	{ title: 'Вакансии', 						link: '/all_vacancies', publish: true, menu_category_id: MenuCategory.first.id},
	{ title: 'Создать резюме', 					link: '/resumes/new', publish: true, menu_category_id: MenuCategory.first.id},
	{ title: 'Опубликовать курс/программу',		link: '#', publish: true, menu_category_id: MenuCategory.second.id},
	{ title: 'Опубликовать специальность', 		link: '#', publish: true, menu_category_id: MenuCategory.second.id},
	{ title: 'Разместить событие', 				link: '/events/new', publish: true, menu_category_id: MenuCategory.second.id},
	{ title: 'Описание услуг', 					link: '/pricelist', publish: true, menu_category_id: MenuCategory.second.id},
	{ title: 'Академия экспертов', 				link: '/experts', publish: true, menu_category_id: MenuCategory.third.id},
	{ title: 'Вебинары GG', 					link: '/webinars', publish: true, menu_category_id: MenuCategory.third.id},
	{ title: 'Assesment center', 				link: '/assessment', publish: true, menu_category_id: MenuCategory.third.id},
	{ title: 'Форум непрерывное образование', 	link: '#', publish: true, menu_category_id: MenuCategory.third.id},
	{ title: 'Опубликовать стажировку',			link: '/company_practices/new', publish: true, menu_category_id: MenuCategory.fourth.id},
	{ title: 'Опубликовать вакансию',			link: '#', publish: true, menu_category_id: MenuCategory.fourth.id},
	{ title: 'Разместить событие', 				link: '/events/new', publish: true, menu_category_id: MenuCategory.fourth.id},
	{ title: 'Описание услуг', 					link: '#', publish: true, menu_category_id: MenuCategory.fourth.id}
]
puts 'Default menu items:'
MenuItem.create(items).each do |item|
	if item.save
		puts 'success'
	else
		puts '>>> MenuItem not created!'
	end
end

Category.destroy_all
categories = [
	{ name: 'Автомобильный бизнес'},
	{ name: 'Гостиницы, рестораны, общепит, кейтеринг'},
	{ name: 'Государственные организации'},
	{ name: 'Добывающая отрасль'},
	{ name: 'ЖКХ'},
	{ name: 'Информационные технологии, системная интеграция, интернет'},
	{ name: 'Искусство, культура'},
	{ name: 'Лесная промышленность, деревообработка'},
	{ name: 'Медицина, фармацевтика, аптеки'},
	{ name: 'Металлургия, металлообработка'},
	{ name: 'Нефть и газ'},
	{ name: 'Образовательные учреждения'},
	{ name: 'Общественная деятельность, партии, благотворительность, НКО'},
	{ name: 'Перевозки, логистика, склад, ВЭД'},
	{ name: 'Продукты питания'},
	{ name: 'Промышленное оборудование, техника, станки и комплектующие'},
	{ name: 'Розничная торговля'},
	{ name: 'СМИ, маркетинг, реклама, BTL, PR, дизайн, продюсирование'},
	{ name: 'Сельское хозяйство'},
	{ name: 'Строительство, недвижимость, эксплуатация, проектирование'},
	{ name: 'Телекоммуникации, связь'},
	{ name: 'Товары народного потребления (непищевые)'},
	{ name: 'Тяжелое машиностроение'},
	{ name: 'Управление многопрофильными активами'},
	{ name: 'Услуги для бизнеса'},
	{ name: 'Услуги для населения'},
	{ name: 'Финансовый сектор'},
	{ name: 'Химическое производство, удобрения'},
	{ name: 'Электроника, приборостроение, бытовая техника, компьютеры и оргтехника'},
	{ name: 'Энергетика'}
]
puts 'Default categories:'
Category.create(categories).each do |category|
	if category.save
		puts 'success'
	else
		puts '>>> Category not created!'
	end
end