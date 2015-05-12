class ChangeCatBirthYearToBirthDate < ActiveRecord::Migration
  def change
    remove_column :cats, :birth_year
    add_column :cats, :birth_date, :datetime, default: 5.years.ago, null: false
  end
end
