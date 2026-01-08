class RemoveFileFromNotes < ActiveRecord::Migration[8.0]
  def change
    remove_column :notes, :file, :binary
  end
end
