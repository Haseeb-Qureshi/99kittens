class AddDetailsToSessions < ActiveRecord::Migration
  def change
    add_column :sessions, :details, :string, null: false
  end
end
