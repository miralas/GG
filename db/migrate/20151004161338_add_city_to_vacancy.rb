class AddCityToVacancy < ActiveRecord::Migration
  def change
  	add_column :vacancies, :city, :string 
  end
end
