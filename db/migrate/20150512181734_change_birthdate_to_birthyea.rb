class ChangeBirthdateToBirthyea < ActiveRecord::Migration
  def change
    remove_column :cats, :birthdate
    add_column :cats, :birth_year, :integer
  end
end
