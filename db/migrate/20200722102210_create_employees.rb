class CreateEmployees < ActiveRecord::Migration[6.0]
  def change
    create_table :employees do |t|
      t.string :first_name
      t.string :last_name, null: false
      t.string :email, null: false
      t.integer :phone_number
      t.datetime :hire_date, null: false
      t.float :salary
      t.integer :commission_pct
      t.integer :manager_id, index: true
      t.references :job, index: true, null: false
      t.references :department, index: true
      t.timestamps
    end
  end
end
