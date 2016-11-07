class CreateCredentials < ActiveRecord::Migration[5.0]
  def change
    create_table :auth_engine_credentials do |t|
      t.string :email, null: false, index: { unique: true }
      t.string :password_digest
      t.belongs_to :user
      t.timestamps null: false
    end
  end
end
