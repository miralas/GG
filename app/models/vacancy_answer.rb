class VacancyAnswer < ActiveRecord::Base
  belongs_to :resume
  belongs_to :company_vacancy
end
