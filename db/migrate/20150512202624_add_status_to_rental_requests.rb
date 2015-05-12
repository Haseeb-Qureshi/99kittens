class AddStatusToRentalRequests < ActiveRecord::Migration
  def change
    add_column :cat_rental_requests, :status, :string, null: false
  end
end
