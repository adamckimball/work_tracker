class RemoveContentColumnFromLogEntry < ActiveRecord::Migration[8.0]
  def change
    remove_column :log_entries, :content, :text
  end
end
