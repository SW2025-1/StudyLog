class ChangeSubjectToSubjectIdInLogs < ActiveRecord::Migration[8.0]
  def change
    remove_column :logs, :subject, :string
    add_column :logs, :subject_id, :integer
  end
end
