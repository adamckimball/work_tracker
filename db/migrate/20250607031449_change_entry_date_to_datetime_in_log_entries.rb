class ChangeEntryDateToDatetimeInLogEntries < ActiveRecord::Migration[8.0]
  def up
    change_column :log_entries, :entry_date, :datetime, null: false
  end

  def down
    change_column :log_entries, :entry_date, :date, null: false
  end
end
