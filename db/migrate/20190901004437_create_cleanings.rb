class CreateCleanings < ActiveRecord::Migration
  def change
    create_table :cleanings do |t|
      t.timestamps
      t.text :diverted
      t.date :date_cleaned
      t.integer :thing_id
      t.integer :user_id

      t.timestamps null: false
    end

    add_index :cleanings, :user_id
    add_index :cleanings, :thing_id
  end
end
