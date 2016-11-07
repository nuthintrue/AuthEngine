class CreateUser < ActiveRecord::Migration[5.0]
  def change
    create_table :auth_engine_users do |t|
      t.string :first_name
      t.string :last_name
      t.string :mobile_phone_number
      t.timestamps
    end
  end
end
