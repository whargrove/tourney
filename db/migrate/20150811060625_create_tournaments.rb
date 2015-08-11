class CreateTournaments < ActiveRecord::Migration
  def change
    create_table :tournaments do |t|
      t.string :name
      t.references :user

      t.timestamps null: false
    end
  end
end
