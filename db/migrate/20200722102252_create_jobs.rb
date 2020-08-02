class CreateJobs < ActiveRecord::Migration[6.0]
  def change
    create_table :jobs do |t|
      t.string :title, null: false
      t.float :min_salary
      t.float :max_salary
      t.timestamps
    end
  end
end
