class CreateGifts < ActiveRecord::Migration
  def change
    create_table :gifts do |t|
      t.text :url, null: false
      t.text :description
      t.text :image_url
      t.references :registry

      t.timestamps null: false
    end
  end
end
