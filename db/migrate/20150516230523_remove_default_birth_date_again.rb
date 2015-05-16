class RemoveDefaultBirthDateAgain < ActiveRecord::Migration
  def change
    change_column :cats, :birth_date, :datetime, null: false, default: nil
  end
end
