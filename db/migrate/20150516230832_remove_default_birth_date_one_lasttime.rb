class RemoveDefaultBirthDateOneLasttime < ActiveRecord::Migration
  def change
    change_column_default :cats, :birth_date, nil
  end
end
