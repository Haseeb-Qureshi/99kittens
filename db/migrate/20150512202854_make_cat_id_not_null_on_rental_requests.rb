class MakeCatIdNotNullOnRentalRequests < ActiveRecord::Migration
  def change
    change_column :cat_rental_requests, :cat_id, :integer, null: false
  end
end
