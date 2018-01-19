class AddUserToPicture < ActiveRecord::Migration[5.0]
  def change
    add_column :pictures, :user_id, :integer, default: 1, null: false
  end
end
