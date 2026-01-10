class AddColumnToSubject < ActiveRecord::Migration[8.0]
  def change
    add_column :subjects, :user_id, :integer
  end
end
