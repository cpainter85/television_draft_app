class AddDraftOrderToUsers < ActiveRecord::Migration
  def change
    add_column :users, :draft_order, :integer
  end
end
