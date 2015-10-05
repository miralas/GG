namespace :industry do
  desc "Add industries from xls file"
  task :from_excel => :environment do
    require 'spreadsheet'

    Industry.destroy_all
    directory = "lib/files/"
    name = directory + 'industries.xls'
    spreadsheet = Spreadsheet.open(name)
    sheet = spreadsheet.worksheet(0)

    sheet.each do |row|
      if row[0]
        industry = Industry.new
        industry.name = row[0]
        industry.save
        puts industry.name
      end
    end

    puts "Заполнено"
  end
end