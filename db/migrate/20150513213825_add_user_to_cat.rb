class AddUserToCat < ActiveRecord::Migration
  def change
    add_column :cats, :user_id, :integer, index: true
  end
end
