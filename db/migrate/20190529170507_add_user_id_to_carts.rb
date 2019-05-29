class AddUserIdToCarts < ActiveRecord::Migration[5.2]
  def change
    add_column :carts, :user_id, :integer
  end
end
