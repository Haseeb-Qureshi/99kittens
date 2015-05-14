class AddConstraintsToSessions < ActiveRecord::Migration
  def change
    change_column :sessions, :user_id, :integer, null: false
    change_column :sessions, :session_token, :string, null: false
  end
end
