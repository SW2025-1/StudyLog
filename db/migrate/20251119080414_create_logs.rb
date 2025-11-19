class CreateLogs < ActiveRecord::Migration[8.0]
  def change
    create_table :logs do |t|
      t.integer :user_id
      t.string :subject
      t.integer :studytime
      t.text :memo
      t.date :studied_on

      t.timestamps
    end
  end
end
