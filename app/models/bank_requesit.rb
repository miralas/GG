class BankRequesit < ActiveRecord::Base
  belongs_to :new_company
  belongs_to :institution
end
