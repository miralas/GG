namespace :users do
  desc "Создает пользователей и компании к ним"
  task :from_file => :environment do
    require 'spreadsheet'

    directory = "lib/files/"
    name = directory + 'companies.xls'
    spreadsheet = Spreadsheet.open(name)
    sheet = spreadsheet.worksheet(0)
    bad_companies = 0
    incorrect = 0
    total = 0
    count = 0

    list_of_pass = Spreadsheet::Workbook.new
    pass_sheet = list_of_pass.create_worksheet :name => 'passwords'

    sheet.each do |row|
      emails = []
      email = ''
      pass = ''
      if row[5] && row[5] != 'e-Mail'
        emails = row[5].strip.split(', ') if row[5].include? ', '
        if !emails.empty?
          if ValidateEmail.valid?(emails.first)
            email = emails.first
            pass = SecureRandom.base64(8)
            @new_user = User.new
            @new_user.email = emails.first
            @new_user.password = pass
            @new_user.password_confirmation = pass
            @new_user.role = 'client'
            @new_user.save
          else
            incorrect += 1
          end
        else
          if ValidateEmail.valid?(row[5].strip)
            email = row[5].strip
            pass = SecureRandom.base64(8)
            @new_user = User.new
            @new_user.email = row[5].strip
            @new_user.password = pass
            @new_user.password_confirmation = pass
            @new_user.role = 'client'
            @new_user.save
          else
            incorrect += 1
          end
        end

        total += 1
      else
        bad_companies += 1
      end

      company = Company.new
      company.title = row[0]
      company.save

      pass_sheet.row(count).push email, pass
      count += 1
    end
    list_of_pass.write 'lib/files/passwords.xls'
    # UserMailer.send_file.deliver_now
    puts "Всего создано #{total}, не найдено Электронных почт: #{bad_companies}, некорректных электронных почт: #{incorrect}"
  end

  desc "Создает пользователей и компании к ним"
  task :from_passwords => :environment do
    require 'spreadsheet'
    directory = "lib/files/"
    name = directory + 'passwords.xls'
    spreadsheet = Spreadsheet.open(name)
    sheet = spreadsheet.worksheet(0)
    sheet.each do |row|
      if row[0]
        @new_user = User.new
        @new_user.email = row[0].strip
        @new_user.password = row[1]
        @new_user.password_confirmation = row[1]
        @new_user.role = 'client'
        @new_user.save
        puts row[0]
      end
    end
  end
end
