class CreateSessions < ActiveRecord::Migration
  def change
    create_table :sessions do |t|
      t.references :user, index: true
      t.string :session_token, index: true, unique: true

      t.timestamps
    end

    remove_column :users, :session_token, :string
  end
end
