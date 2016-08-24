class AddUserIdToReeviews < ActiveRecord::Migration
  def change
    add_column :reeviews, :user_id, :integer
  end
end
