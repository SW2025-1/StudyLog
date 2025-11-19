class CreateTags < ActiveRecord::Migration[8.0]
  def change
    create_table :tags do |t|
      t.integer :user_id
      t.string :tagname

      t.timestamps
    end
  end
end
