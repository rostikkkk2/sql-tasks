class CreateJobHistories < ActiveRecord::Migration[6.0]
  def change
    create_table :job_histories do |t|
      t.datetime :start_date, null: false
      t.datetime :end_date, null: false
      t.references :employee, index: true, null: false
      t.references :job, index: true, null: false
      t.references :department, index: true
      t.timestamps
    end
  end
end
