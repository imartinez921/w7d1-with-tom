class AddUserIDtoCatRentalRequest < ActiveRecord::Migration[5.2]
  def change

    add_column :CatRentalRequests, :requester_id
    add_index :CatRentalRequests, :requester_id
  end
end
