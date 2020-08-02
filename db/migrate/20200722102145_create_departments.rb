class CreateDepartments < ActiveRecord::Migration[6.0]
  def change
    create_table :departments do |t|
      t.string :name, null: false
      t.integer :manager_id, index: true
      t.references :location, index: true
      t.timestamps
    end
  end
end
