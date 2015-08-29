class UserMailer < ActionMailer::Base
  default from: "miralas777@yandex.ru"

  def send_file
  	attachments['passwords.xls'] = File.read('lib/files/passwords.xls')
    mail(to: 'miralas777@yandex.ru', subject: "New file")
  end
end
