class AddFileToNotes < ActiveRecord::Migration[8.0]
  def change
    add_column :notes, :file, :binary
  end
end
