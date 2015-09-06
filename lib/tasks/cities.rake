namespace :cities do
  desc "Создает классификатор городов по населению"
  task :from_file => :environment do
    require 'spreadsheet'

    directory = "lib/files/"
    name = directory + 'cities.xls'
    spreadsheet = Spreadsheet.open(name)
    sheet = spreadsheet.worksheet(0)

    sheet.each do |row|
      if row[0]
        city = City.new
        city.name = row[0]
        city.save
      end
    end

    puts "Заполнено"
  end

end
