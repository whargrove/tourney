class CreateRounds < ActiveRecord::Migration
  def change
    create_table :rounds do |t|
      t.integer :number
      t.references :tournament

      t.timestamps null: false
    end
  end
end
