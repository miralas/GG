namespace :cities do
  desc "Создает классификатор городов по населению"
  task :from_file => :environment do
    require 'spreadsheet'

    City.destroy_all
    directory = "lib/files/"
    name = directory + 'cities.xls'
    spreadsheet = Spreadsheet.open(name)
    sheet = spreadsheet.worksheet(0)

    sheet.each do |row|
      if row[0]
        city = City.new
        city.name = row[0]
        city.save
        puts city.name
      end
    end

    puts "Заполнено"
  end

  desc "Fill countries"
  task :from_countries => :environment do
    require 'spreadsheet'

    directory = "lib/files/"
    name = directory + 'countries.xls'
    spreadsheet = Spreadsheet.open(name)
    sheet = spreadsheet.worksheet(0)

    sheet.each do |row|
      if row[0]
        country = Country.new
        country.name = row[0]
        country.save
      end
    end

    puts "Заполнено"
  end
end
