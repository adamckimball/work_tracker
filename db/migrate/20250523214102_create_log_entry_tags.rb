class CreateLogEntryTags < ActiveRecord::Migration[8.0]
  def change
    create_table :log_entry_tags do |t|
      t.references :log_entry, null: false, foreign_key: true
      t.references :tag, null: false, foreign_key: true

      t.timestamps
    end
    add_index :log_entry_tags, [:log_entry_id, :tag_id], unique: true
  end
end
