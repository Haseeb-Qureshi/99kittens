class RemoveDefaultBirthDate < ActiveRecord::Migration
  def change
    change_column :cats, :birth_date, :datetime, null: false
  end
end
