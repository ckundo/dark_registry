class CreateRegistries < ActiveRecord::Migration
  def change
    create_table :registries do |t|
      t.string :title, null: false
      t.references :user, null: false

      t.timestamps null: false
    end
  end
end
