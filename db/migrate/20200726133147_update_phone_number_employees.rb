class UpdatePhoneNumberEmployees < ActiveRecord::Migration[6.0]
  def change
    change_column :employees, :phone_number, :string, limit: 20
  end
end
