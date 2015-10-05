class Requesit < ActiveRecord::Base
  belongs_to :new_company
  belongs_to :institution
end
