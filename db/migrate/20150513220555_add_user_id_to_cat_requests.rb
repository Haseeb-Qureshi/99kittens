class AddUserIdToCatRequests < ActiveRecord::Migration
  def change
    add_column :cat_rental_requests, :user_id, :integer, default: 1, null: false, index: true, unique: true
  end

end
