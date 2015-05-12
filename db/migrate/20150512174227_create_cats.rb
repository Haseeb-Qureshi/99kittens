class CreateCats < ActiveRecord::Migration
  def change
    create_table :cats do |t|
      t.datetime :birthdate
      t.string :color
      t.string :name, null: false
      t.string :sex, null: false
      t.text :description

      t.timestamps null: false
    end
    add_index :cats, :name
  end
end
