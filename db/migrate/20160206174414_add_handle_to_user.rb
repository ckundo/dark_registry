class AddHandleToUser < ActiveRecord::Migration
  def change
    add_column :users, :handle, :string, unique: true
  end
end
