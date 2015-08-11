class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.String :first_name null: false
      t.String :last_name null: false
      t.String :email null: false
      t.String :password_digest null: false

      t.timestamps null: false
    end
  end
end
