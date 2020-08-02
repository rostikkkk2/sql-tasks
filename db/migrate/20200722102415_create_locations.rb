class CreateLocations < ActiveRecord::Migration[6.0]
  def change
    create_table :locations do |t|
      t.string :street_address, null: false
      t.string :postal_code, null: false
      t.string :city, null: false
      t.string :state_province, null: false
      t.references :country, index: true
      t.timestamps
    end
  end
end
